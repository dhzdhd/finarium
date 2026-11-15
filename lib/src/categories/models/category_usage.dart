import 'package:finarium/src/budgets/models/budget_plan.dart';

String categoryKey(String name) => name.trim().toLowerCase();

({int transactions, int budgets}) categoryUsage({
  required String name,
  required Iterable<String> transactionCategories,
  required Iterable<List<BudgetAllocation>> allocationsPerBudget,
}) {
  final key = categoryKey(name);
  return (
    transactions: transactionCategories
        .where((category) => categoryKey(category) == key)
        .length,
    budgets: allocationsPerBudget
        .where(
          (allocations) => allocations.any(
            (allocation) => categoryKey(allocation.category) == key,
          ),
        )
        .length,
  );
}
