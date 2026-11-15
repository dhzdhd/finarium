import 'package:finarium/src/budgets/models/budget_summary.dart';
import 'package:finarium/src/core/formatters.dart';
import 'package:flutter/material.dart';

class BudgetSummaryCard extends StatelessWidget {
  const BudgetSummaryCard({super.key, required this.summary});

  final BudgetSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final muted = colorScheme.onSurfaceVariant;
    final lastDay = summary.end.subtract(const Duration(days: 1));
    final fraction = summary.limitMinor == 0
        ? 0.0
        : (summary.spentMinor / summary.limitMinor).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total spent · ${formatDayMonth(summary.start)} to ${formatDayMonth(lastDay)}',
            style: theme.textTheme.bodyMedium?.copyWith(color: muted),
          ),
          const SizedBox(height: 4),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 8,
            children: [
              Text(
                formatInr(summary.spentMinor ~/ 100),
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'of ${formatInr(summary.limitMinor ~/ 100)}',
                style: theme.textTheme.titleMedium?.copyWith(color: muted),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 8,
              backgroundColor: colorScheme.surfaceContainerHighest,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _Stat(
                  label: 'Left to spend',
                  value: formatInr(summary.leftMinor ~/ 100),
                ),
              ),
              Expanded(
                child: _Stat(
                  label: 'Projected total',
                  value: formatInr(summary.projectedMinor ~/ 100),
                ),
              ),
              Expanded(
                child: _Stat(
                  label: 'Days left',
                  value: '${summary.daysLeft}',
                  alignEnd: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value, this.alignEnd = false});

  final String label;
  final String value;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
