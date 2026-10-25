import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/transactions/enums/capture_source.dart';
import 'package:finarium/src/transactions/enums/transaction_filter.dart';
import 'package:finarium/src/transactions/models/merchant.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:finarium/src/transactions/widgets/budget_overview_card.dart';
import 'package:finarium/src/transactions/widgets/transaction_filter_chips.dart';
import 'package:finarium/src/transactions/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';

List<Transaction> _sampleTransactions(DateTime now) {
  final today = DateTime(now.year, now.month, now.day, 18);
  final yesterday = today.subtract(const Duration(days: 1));

  return [
    Transaction.expense(
      id: 't1',
      amountMinor: 48600,
      merchant: const Merchant.named('Swiggy'),
      category: 'Food & dining',
      paymentSource: 'Visa ••4242',
      captureSource: CaptureSource.notification,
      occurredAt: today,
      createdAt: today,
      updatedAt: today,
    ),
    Transaction.subscription(
      id: 't2',
      amountMinor: 64900,
      merchant: const Merchant.named('Netflix'),
      category: 'Subscription',
      paymentSource: 'Visa ••4242',
      captureSource: CaptureSource.notification,
      occurredAt: today,
      createdAt: today,
      updatedAt: today,
      firstBillingDate: today,
      frequency: SubscriptionFrequency.monthly,
    ),
    Transaction.expense(
      id: 't3',
      amountMinor: 120000,
      merchant: const Merchant.unknown(),
      category: 'Uncategorised',
      paymentSource: 'UPI ••4521',
      captureSource: CaptureSource.notification,
      occurredAt: today,
      createdAt: today,
      updatedAt: today,
    ),
    Transaction.income(
      id: 't4',
      amountMinor: 8500000,
      merchant: const Merchant.named('Acme Pvt Ltd'),
      category: 'Salary',
      paymentSource: 'Account ••9012',
      captureSource: CaptureSource.manual,
      occurredAt: yesterday,
      createdAt: yesterday,
      updatedAt: yesterday,
    ),
    Transaction.expense(
      id: 't5',
      amountMinor: 21200,
      merchant: const Merchant.named('Uber'),
      category: 'Transport',
      paymentSource: 'UPI',
      captureSource: CaptureSource.notification,
      occurredAt: yesterday,
      createdAt: yesterday,
      updatedAt: yesterday,
    ),
  ];
}

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

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
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
    final now = DateTime.now();
    final transactions = _filtered(_sampleTransactions(now));

    final groups = <String, List<Transaction>>{};
    for (final transaction in transactions) {
      groups
          .putIfAbsent(_dayLabel(transaction.occurredAt, now), () => [])
          .add(transaction);
    }

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
          SearchBar(
            hintText: 'Search merchants or notes',
            leading: const Icon(Icons.search),
            trailing: [
              CircleAvatar(
                radius: 18,
                backgroundColor: colorScheme.primary,
                child: Text(
                  'D',
                  style: TextStyle(color: colorScheme.onPrimary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TransactionFilterChips(
            selected: _filter,
            onSelected: (filter) => setState(() => _filter = filter),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 96),
              children: [
                for (final group in groups.entries) ...[
                  _DayHeader(
                    label: group.key,
                    totalMinor: group.value.fold<int>(
                      0,
                      (sum, t) =>
                          sum +
                          (t is IncomeTransaction
                              ? t.amountMinor
                              : -t.amountMinor),
                    ),
                  ),
                  for (var i = 0; i < group.value.length; i++) ...[
                    TransactionListItem(transaction: group.value[i]),
                    if (i < group.value.length - 1) const Divider(height: 1),
                  ],
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        ],
      ),
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
