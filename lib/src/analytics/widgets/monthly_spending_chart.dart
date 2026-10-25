import 'package:finarium/src/analytics/models/analytics_models.dart';
import 'package:flutter/material.dart';

class MonthlySpendingChart extends StatelessWidget {
  const MonthlySpendingChart({super.key, required this.months});

  final List<MonthlyTotal> months;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final maxAmount = months.fold<int>(
      0,
      (max, month) => month.amount > max ? month.amount : max,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Monthly spending',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Text(
                'Last ${months.length} months',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 12,
              children: [
                for (var i = 0; i < months.length; i++)
                  Expanded(
                    child: _Bar(
                      month: months[i],
                      fraction: maxAmount == 0
                          ? 0
                          : months[i].amount / maxAmount,
                      isCurrent: i == months.length - 1,
                      topLabel: months[i].amount == maxAmount
                          ? '₹${(months[i].amount / 1000).round()}k'
                          : null,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.month,
    required this.fraction,
    required this.isCurrent,
    this.topLabel,
  });

  final MonthlyTotal month;
  final double fraction;
  final bool isCurrent;
  final String? topLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 20,
          child: topLabel == null
              ? null
              : Text(
                  topLabel!,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: FractionallySizedBox(
            heightFactor: fraction.clamp(0.0, 1.0),
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isCurrent
                    ? colorScheme.primary
                    : colorScheme.primary.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          month.label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
