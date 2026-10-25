import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/transactions/enums/transaction_filter.dart';
import 'package:finarium/src/transactions/models/transaction_entry.dart';
import 'package:finarium/src/transactions/widgets/budget_overview_card.dart';
import 'package:finarium/src/transactions/widgets/transaction_filter_chips.dart';
import 'package:finarium/src/transactions/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';

const _entries = [
  TransactionEntry(
    id: 't1',
    initial: 'S',
    merchant: 'Swiggy',
    detail: 'Food & dining · Visa ••4242',
    dayLabel: 'Today · 10 Oct',
    amount: 486,
    isIncome: false,
    source: 'SMS',
    needsReview: false,
  ),
  TransactionEntry(
    id: 't2',
    initial: 'N',
    merchant: 'Netflix',
    detail: 'Subscription · Visa ••4242',
    dayLabel: 'Today · 10 Oct',
    amount: 649,
    isIncome: false,
    source: 'Auto-detected',
    needsReview: false,
  ),
  TransactionEntry(
    id: 't3',
    initial: '?',
    merchant: 'UPI ••4521',
    detail: 'Uncategorised',
    dayLabel: 'Today · 10 Oct',
    amount: 1200,
    isIncome: false,
    source: '',
    needsReview: true,
  ),
  TransactionEntry(
    id: 't4',
    initial: 'A',
    merchant: 'Acme Pvt Ltd',
    detail: 'Salary · Account ••9012',
    dayLabel: 'Yesterday · 9 Oct',
    amount: 85000,
    isIncome: true,
    source: 'Manual',
    needsReview: false,
  ),
  TransactionEntry(
    id: 't5',
    initial: 'U',
    merchant: 'Uber',
    detail: 'Transport · UPI',
    dayLabel: 'Yesterday · 9 Oct',
    amount: 212,
    isIncome: false,
    source: 'Notification',
    needsReview: false,
  ),
];

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  var _filter = TransactionFilter.all;

  List<TransactionEntry> get _filtered => switch (_filter) {
    TransactionFilter.all => _entries,
    TransactionFilter.expenses => _entries.where((e) => !e.isIncome).toList(),
    TransactionFilter.income => _entries.where((e) => e.isIncome).toList(),
    TransactionFilter.toReview => _entries.where((e) => e.needsReview).toList(),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final groups = <String, List<TransactionEntry>>{};
    for (final entry in _filtered) {
      groups.putIfAbsent(entry.dayLabel, () => []).add(entry);
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
                    total: group.value.fold<int>(
                      0,
                      (sum, e) => sum + (e.isIncome ? e.amount : -e.amount),
                    ),
                  ),
                  for (final entry in group.value) ...[
                    TransactionListItem(entry: entry),
                    if (entry != group.value.last) const Divider(height: 1),
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
  const _DayHeader({required this.label, required this.total});

  final String label;
  final int total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final sign = total < 0 ? '−' : '+';

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
            '$sign${formatInr(total.abs())}',
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
