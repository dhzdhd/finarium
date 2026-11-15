import 'package:finarium/src/budgets/models/budget_summary.dart';
import 'package:finarium/src/core/formatters.dart';
import 'package:flutter/material.dart';

const _nearLimitColor = Color(0xFFC47D0E);
const _nearLimitBackground = Color(0xFFFFE8B0);

class BudgetCategoryTile extends StatelessWidget {
  const BudgetCategoryTile({super.key, required this.progress, this.onTap});

  final CategoryProgress progress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final name = progress.category;
    final barColor = switch (progress.status) {
      BudgetStatus.overLimit => colorScheme.error,
      BudgetStatus.nearLimit => _nearLimitColor,
      BudgetStatus.onTrack => colorScheme.primary,
    };

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: colorScheme.primaryContainer.withValues(
                    alpha: 0.5,
                  ),
                  child: Text(
                    name.isEmpty ? '?' : name[0].toUpperCase(),
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
                        '${formatInr(progress.spentMinor ~/ 100)} of '
                        '${formatInr(progress.limitMinor ~/ 100)} · '
                        '${progress.percent}%',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _StatusChip(status: progress.status),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress.fraction.clamp(0.0, 1.0),
                minHeight: 6,
                color: barColor,
                backgroundColor: colorScheme.surfaceContainerHighest,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final BudgetStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final (label, background, foreground) = switch (status) {
      BudgetStatus.overLimit => (
        'Over limit',
        colorScheme.errorContainer,
        colorScheme.onErrorContainer,
      ),
      BudgetStatus.nearLimit => (
        'Near limit',
        _nearLimitBackground,
        const Color(0xFF5C4300),
      ),
      BudgetStatus.onTrack => (
        'On track',
        colorScheme.secondaryContainer,
        colorScheme.onSecondaryContainer,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(color: foreground),
      ),
    );
  }
}
