import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/transactions/enums/capture_source.dart';
import 'package:finarium/src/transactions/models/merchant.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isIncome = transaction is IncomeTransaction;
    final amountColor = isIncome ? colorScheme.primary : null;

    final (name, initial) = switch (transaction.merchant) {
      NamedMerchant(:final name) => (
        name,
        name.isEmpty ? '?' : name[0].toUpperCase(),
      ),
      UnknownMerchant() => ('Unknown merchant', '?'),
    };

    final source = switch (transaction.captureSource) {
      CaptureSource.manual => 'Manual',
      CaptureSource.notification => 'Notification',
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: colorScheme.primaryContainer.withValues(alpha: 0.5),
            child: Text(
              initial,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: theme.textTheme.titleMedium),
                Text(
                  '${transaction.category} · ${transaction.paymentSource}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isIncome ? '+' : '−'}${formatInr(transaction.amountMinor ~/ 100)}',
                style: theme.textTheme.titleMedium?.copyWith(color: amountColor),
              ),
              if (transaction.needsReview)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE8B0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Needs review',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: const Color(0xFF5C4300),
                    ),
                  ),
                )
              else
                Text(
                  source,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
