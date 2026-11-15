import 'package:drift/drift.dart';
import 'package:finarium/src/budgets/tables/budget_plans_table.dart';
import 'package:finarium/src/categories/models/category.dart';
import 'package:finarium/src/categories/models/category_usage.dart';
import 'package:finarium/src/categories/tables/categories_table.dart';
import 'package:finarium/src/database.dart';
import 'package:finarium/src/transactions/tables/transactions_table.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables: [Categories, Transactions, BudgetPlans])
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(super.db);

  Stream<List<Category>> watchAll() {
    final query = select(categories)
      ..orderBy([
        (c) => OrderingTerm.asc(c.sortOrder),
        (c) => OrderingTerm.asc(c.name),
      ]);
    return query.watch().map((rows) => rows.map(_categoryFromRow).toList());
  }

  Future<({int transactions, int budgets})> usage(String name) async {
    final transactionRows = await select(transactions).get();
    final planRows = await select(budgetPlans).get();
    return categoryUsage(
      name: name,
      transactionCategories: transactionRows.map((row) => row.category),
      allocationsPerBudget: planRows.map((row) => row.allocations),
    );
  }

  Future<void> save(Category category, {String? previousName}) async {
    await transaction(() async {
      final existing = await (select(
        categories,
      )..where((c) => c.id.equals(category.id))).getSingleOrNull();
      final sortOrder = existing?.sortOrder ?? await _nextSortOrder();

      await into(
        categories,
      ).insertOnConflictUpdate(_categoryCompanion(category, sortOrder));
      if (previousName == null || previousName == category.name) return;

      final key = categoryKey(previousName);

      final transactionRows = await select(transactions).get();
      for (final row in transactionRows) {
        if (categoryKey(row.category) != key) continue;
        await (update(transactions)..where((t) => t.id.equals(row.id))).write(
          TransactionsCompanion(category: Value(category.name)),
        );
      }

      final planRows = await select(budgetPlans).get();
      for (final row in planRows) {
        if (!row.allocations.any((a) => categoryKey(a.category) == key)) {
          continue;
        }
        final allocations = [
          for (final allocation in row.allocations)
            categoryKey(allocation.category) == key
                ? allocation.copyWith(category: category.name)
                : allocation,
        ];
        await (update(budgetPlans)..where((p) => p.id.equals(row.id))).write(
          BudgetPlansCompanion(allocations: Value(allocations)),
        );
      }
    });
  }

  /// Stores the order of [ordered] as 0..n-1.
  Future<void> reorder(List<Category> ordered) {
    return transaction(() async {
      for (var i = 0; i < ordered.length; i++) {
        await (update(categories)..where((c) => c.id.equals(ordered[i].id)))
            .write(CategoriesCompanion(sortOrder: Value(i)));
      }
    });
  }

  Future<int> deleteById(String id) {
    return (delete(categories)..where((c) => c.id.equals(id))).go();
  }

  Future<int> _nextSortOrder() async {
    final rows = await select(categories).get();
    return rows.fold(-1, (max, row) => row.sortOrder > max ? row.sortOrder : max) +
        1;
  }
}

Category _categoryFromRow(CategoryRow row) {
  return Category(
    id: row.id,
    name: row.name,
    colorValue: row.colorValue,
    sortOrder: row.sortOrder,
  );
}

CategoriesCompanion _categoryCompanion(Category category, int sortOrder) {
  return CategoriesCompanion(
    id: Value(category.id),
    name: Value(category.name),
    colorValue: Value(category.colorValue),
    sortOrder: Value(sortOrder),
  );
}
