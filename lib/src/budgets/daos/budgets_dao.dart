import 'package:drift/drift.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart';
import 'package:finarium/src/budgets/tables/budget_plans_table.dart';
import 'package:finarium/src/database.dart';
import 'package:fpdart/fpdart.dart' show Option;

part 'budgets_dao.g.dart';

@DriftAccessor(tables: [BudgetPlans])
class BudgetsDao extends DatabaseAccessor<AppDatabase> with _$BudgetsDaoMixin {
  BudgetsDao(super.db);

  Stream<List<BudgetPlan>> watchAll() {
    final query = select(budgetPlans)
      ..orderBy([(b) => OrderingTerm.desc(b.updatedAt)]);
    return query.watch().map((rows) => rows.map(_planFromRow).toList());
  }

  Future<void> upsert(BudgetPlan plan) {
    return into(budgetPlans).insertOnConflictUpdate(_planCompanion(plan));
  }

  Future<int> deleteById(String id) {
    return (delete(budgetPlans)..where((b) => b.id.equals(id))).go();
  }
}

BudgetPlan _planFromRow(BudgetPlanRow row) {
  return BudgetPlan(
    id: row.id,
    period: row.period,
    totalMinor: row.totalMinor,
    allocations: row.allocations,
    customStart: Option.fromNullable(row.customStart?.toUtc()),
    customEnd: Option.fromNullable(row.customEnd?.toUtc()),
    createdAt: row.createdAt.toUtc(),
    updatedAt: row.updatedAt.toUtc(),
  );
}

BudgetPlansCompanion _planCompanion(BudgetPlan plan) {
  return BudgetPlansCompanion(
    id: Value(plan.id),
    period: Value(plan.period),
    totalMinor: Value(plan.totalMinor),
    customStart: Value(plan.customStart.toNullable()),
    customEnd: Value(plan.customEnd.toNullable()),
    allocations: Value(plan.allocations),
    createdAt: Value(plan.createdAt),
    updatedAt: Value(plan.updatedAt),
  );
}
