import 'package:finarium/src/core/formatters.dart';
import 'package:finarium/src/transactions/models/transaction_entry.dart';
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({super.key, required this.entry});

  final TransactionEntry entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final amountColor = entry.isIncome ? colorScheme.primary : null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: colorScheme.primaryContainer.withValues(alpha: 0.5),
            child: Text(
              entry.initial,
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
                Text(entry.merchant, style: theme.textTheme.titleMedium),
                Text(
                  entry.detail,
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
                '${entry.isIncome ? '+' : '−'}${formatInr(entry.amount)}',
                style: theme.textTheme.titleMedium?.copyWith(color: amountColor),
              ),
              if (entry.needsReview)
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
              else if (entry.source.isNotEmpty)
                Text(
                  entry.source,
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
