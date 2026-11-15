import 'package:finarium/src/budgets/controllers/budgets_controller.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart';
import 'package:finarium/src/categories/controllers/categories_controller.dart';
import 'package:finarium/src/categories/models/category.dart';
import 'package:finarium/src/categories/models/category_usage.dart';
import 'package:finarium/src/categories/widgets/category_sheet.dart';
import 'package:finarium/src/transactions/controllers/transaction_controller.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  var _searching = false;
  final _query = TextEditingController();

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  void _reorder(List<Category> items, int oldIndex, int newIndex) {
    final ordered = [...items];
    ordered.insert(newIndex, ordered.removeAt(oldIndex));
    ref.read(categoriesControllerProvider.notifier).reorder(ordered);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final all =
        ref.watch(categoriesControllerProvider).value ?? const <Category>[];
    final transactions =
        ref.watch(transactionsControllerProvider).value ??
        const <Transaction>[];
    final plans =
        ref.watch(budgetsControllerProvider).value ?? const <BudgetPlan>[];

    final query = categoryKey(_query.text);
    final items = [
      for (final category in all)
        if (query.isEmpty || categoryKey(category.name).contains(query))
          category,
    ];

    final knownNames = {for (final category in all) categoryKey(category.name)};
    final uncategorised = transactions
        .where((t) => !knownNames.contains(categoryKey(t.category)))
        .length;
    final reorderable = query.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: _searching
            ? TextField(
                controller: _query,
                autofocus: true,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: 'Search categories',
                  border: InputBorder.none,
                ),
              )
            : const Text('Categories'),
        actions: [
          IconButton(
            tooltip: _searching ? 'Close search' : 'Search',
            icon: Icon(_searching ? Icons.close : Icons.search),
            onPressed: () => setState(() {
              _searching = !_searching;
              _query.clear();
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add category'),
        icon: const Icon(Icons.add),
        onPressed: () => editCategory(context, ref),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (uncategorised > 0) ...[
              _UncategorisedBanner(count: uncategorised),
              const SizedBox(height: 16),
            ],
            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: Text(
                        all.isEmpty ? 'No categories yet' : 'No matches',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : ReorderableListView.builder(
                      buildDefaultDragHandles: false,
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      onReorderItem: reorderable
                          ? (oldIndex, newIndex) =>
                                _reorder(items, oldIndex, newIndex)
                          : (_, _) {},
                      itemBuilder: (context, index) {
                        final category = items[index];
                        final color = Color(category.colorValue);
                        final usage = categoryUsage(
                          name: category.name,
                          transactionCategories: transactions.map(
                            (t) => t.category,
                          ),
                          allocationsPerBudget: plans.map((p) => p.allocations),
                        );

                        return Padding(
                          key: ValueKey(category.id),
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Material(
                            color: colorScheme.surface,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: colorScheme.outlineVariant,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.fromLTRB(
                                16,
                                8,
                                8,
                                8,
                              ),
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor: color.withValues(alpha: 0.2),
                                child: Text(
                                  category.name.isEmpty
                                      ? '?'
                                      : category.name[0].toUpperCase(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: color,
                                  ),
                                ),
                              ),
                              title: Text(
                                category.name,
                                style: theme.textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                '${usage.transactions} transaction'
                                '${usage.transactions == 1 ? '' : 's'}',
                              ),
                              trailing: reorderable
                                  ? ReorderableDragStartListener(
                                      index: index,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.drag_handle,
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    )
                                  : null,
                              onTap: () => editCategory(
                                context,
                                ref,
                                existing: category,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UncategorisedBanner extends StatelessWidget {
  const _UncategorisedBanner({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const foreground = Color(0xFF5C4300);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3D6),
        border: Border.all(color: const Color(0xFFE8C170)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: foreground),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              count == 1
                  ? '1 transaction has no category'
                  : '$count transactions have no category',
              style: theme.textTheme.bodyLarge?.copyWith(color: foreground),
            ),
          ),
          TextButton(
            onPressed: null,
            child: Text(
              'Assign',
              style: theme.textTheme.titleSmall?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
