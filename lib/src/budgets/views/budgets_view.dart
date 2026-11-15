import 'package:finarium/src/budgets/controllers/budget_period_selection.dart';
import 'package:finarium/src/budgets/controllers/budgets_controller.dart';
import 'package:finarium/src/budgets/enums/budget_period.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart';
import 'package:finarium/src/budgets/models/budget_summary.dart';
import 'package:finarium/src/budgets/widgets/add_budget_sheet.dart';
import 'package:finarium/src/budgets/widgets/budget_category_tile.dart';
import 'package:finarium/src/budgets/widgets/budget_summary_card.dart';
import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/transactions/controllers/transaction_controller.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetsView extends ConsumerWidget {
  const BudgetsView({super.key});

  Future<void> _selectPeriod(
    BuildContext context,
    WidgetRef ref,
    BudgetPeriod next,
  ) async {
    final notifier = ref.read(budgetPeriodSelectionProvider.notifier);
    if (next != BudgetPeriod.custom) {
      notifier.choose(next);
      return;
    }

    final now = DateTime.now();
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 1),
      initialDateRange: ref.read(budgetPeriodSelectionProvider).custom,
    );
    if (range != null) {
      notifier.choose(BudgetPeriod.custom, custom: range);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(budgetPeriodSelectionProvider);
    final plans =
        ref.watch(budgetsControllerProvider).value ?? const <BudgetPlan>[];
    final transactions =
        ref.watch(transactionsControllerProvider).value ??
        const <Transaction>[];
    final plan = findBudgetPlan(plans, selection.period, selection.custom);

    final children = <Widget>[
      SegmentedButton<BudgetPeriod>(
        showSelectedIcon: true,
        segments: [
          for (final period in BudgetPeriod.values)
            ButtonSegment(value: period, label: Text(period.label)),
        ],
        selected: {selection.period},
        onSelectionChanged: (set) => _selectPeriod(context, ref, set.first),
      ),
      const SizedBox(height: 16),
    ];

    if (plan == null) {
      children.add(_NoPlanCard(onCreate: () => AddBudgetSheet.show(context)));
    } else {
      final summary = buildBudgetSummary(
        plan: plan,
        transactions: transactions,
        now: DateTime.now(),
      );
      final overLimit = summary.overLimit.firstOrNull;

      children.add(
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => AddBudgetSheet.show(context, existing: plan),
          child: BudgetSummaryCard(summary: summary),
        ),
      );
      if (overLimit != null) {
        children
          ..add(const SizedBox(height: 16))
          ..add(
            _OverLimitBanner(
              progress: overLimit,
              onReview: () => AddBudgetSheet.show(context, existing: plan),
            ),
          );
      }
      children
        ..add(const SizedBox(height: 24))
        ..add(
          Text(
            'Categories',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      for (final progress in summary.categories) {
        children.add(
          BudgetCategoryTile(
            progress: progress,
            onTap: () => AddBudgetSheet.show(context, existing: plan),
          ),
        );
      }
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      children: children,
    );
  }
}

class _NoPlanCard extends StatelessWidget {
  const _NoPlanCard({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No budget for this period',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Set a total and split it across categories.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(onPressed: onCreate, child: const Text('Create budget')),
        ],
      ),
    );
  }
}

class _OverLimitBanner extends StatelessWidget {
  const _OverLimitBanner({required this.progress, required this.onReview});

  final CategoryProgress progress;
  final VoidCallback onReview;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final over = progress.spentMinor - progress.limitMinor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: colorScheme.error),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '${progress.category} is ${formatInr(over ~/ 100)} over its limit',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onErrorContainer,
              ),
            ),
          ),
          TextButton(
            onPressed: onReview,
            child: Text(
              'Review',
              style: TextStyle(color: colorScheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
