import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/transactions/controllers/transaction_controller.dart';
import 'package:finarium/src/transactions/enums/transaction_filter.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:finarium/src/transactions/widgets/budget_overview_card.dart';
import 'package:finarium/src/transactions/widgets/transaction_filter_chips.dart';
import 'package:finarium/src/transactions/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String _dayLabel(DateTime date, DateTime now) {
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(date.year, date.month, date.day);
  final base = formatDayMonth(day);

  return switch (today.difference(day).inDays) {
    0 => 'Today · $base',
    1 => 'Yesterday · $base',
    _ => '$base ${day.year}',
  };
}

class TransactionView extends ConsumerStatefulWidget {
  const TransactionView({super.key});

  @override
  ConsumerState<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends ConsumerState<TransactionView> {
  var _filter = TransactionFilter.all;

  List<Transaction> _filtered(List<Transaction> transactions) {
    return switch (_filter) {
      .all => transactions,
      .expenses => transactions.whereType<ExpenseTransaction>().toList(),
      .income => transactions.whereType<IncomeTransaction>().toList(),
      .subscriptions =>
        transactions.whereType<SubscriptionTransaction>().toList(),
      .toReview => transactions.where((t) => t.needsReview).toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final transactions = ref.watch(transactionsControllerProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BudgetOverviewCard(
            month: 'October',
            spent: 42380,
            budget: 60000,
            progress: 0.71,
            onTrack: true,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: SearchBar(
              hintText: 'Search merchants or notes',
              leading: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 12),
          TransactionFilterChips(
            selected: _filter,
            onSelected: (filter) => setState(() => _filter = filter),
          ),
          Expanded(
            child: switch (transactions) {
              AsyncLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              AsyncError(:final error) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Could not load transactions',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$error',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () =>
                          ref.invalidate(transactionsControllerProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              AsyncData(:final value) => _buildList(context, _filtered(value)),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, List<Transaction> transactions) {
    final theme = Theme.of(context);
    final now = DateTime.now();

    if (transactions.isEmpty) {
      return Center(
        child: Text(
          'No transactions yet',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    final groups = <String, List<Transaction>>{};
    for (final transaction in transactions) {
      groups
          .putIfAbsent(_dayLabel(transaction.occurredAt, now), () => [])
          .add(transaction);
    }

    return ListView(
      padding: const EdgeInsets.only(bottom: 96),
      children: [
        for (final group in groups.entries) ...[
          _DayHeader(
            label: group.key,
            totalMinor: group.value.fold<int>(
              0,
              (sum, t) =>
                  sum +
                  (t is IncomeTransaction ? t.amountMinor : -t.amountMinor),
            ),
          ),
          for (var i = 0; i < group.value.length; i++) ...[
            TransactionListItem(transaction: group.value[i]),
            if (i < group.value.length - 1) const Divider(height: 1),
          ],
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.label, required this.totalMinor});

  final String label;
  final int totalMinor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final sign = totalMinor < 0 ? '−' : '+';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Text(
            '$sign${formatInr(totalMinor.abs() ~/ 100)}',
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
