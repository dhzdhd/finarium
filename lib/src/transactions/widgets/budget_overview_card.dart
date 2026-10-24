import 'package:flutter/material.dart';

class BudgetOverviewCard extends StatelessWidget {
  const BudgetOverviewCard({
    super.key,
    required this.month,
    required this.spent,
    required this.budget,
    required this.progress,
    this.onTrack = true,
  });

  final String month;
  final int spent;
  final int budget;
  final double progress;
  final bool onTrack;

  @override
  Widget build(BuildContext context) {
    final remaining = budget - spent;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? colorScheme.primaryContainer : colorScheme.primary;
    final textColor = isDark ? colorScheme.onPrimaryContainer : colorScheme.onPrimary;
    final subTextColor = isDark
        ? colorScheme.onPrimaryContainer.withValues(alpha: 0.7)
        : colorScheme.onPrimary.withValues(alpha: 0.7);
    final barBgColor = isDark
        ? colorScheme.primary.withValues(alpha: 0.3)
        : colorScheme.onPrimary.withValues(alpha: 0.2);
    final barFillColor = isDark ? colorScheme.onPrimaryContainer : colorScheme.onPrimary;
    final badgeBgColor = isDark ? colorScheme.secondaryContainer : colorScheme.secondary;
    final badgeTextColor = isDark ? colorScheme.onSecondaryContainer : colorScheme.onSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Spent so far in $month',
            style: TextStyle(fontSize: 14, color: subTextColor),
          ),
          const SizedBox(height: 8),
          Text(
            '₹${_formatNumber(spent)}',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 10,
              child: Stack(
                children: [
                  Container(color: barBgColor),
                  FractionallySizedBox(
                    widthFactor: progress.clamp(0.0, 1.0),
                    child: Container(color: barFillColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹${_formatNumber(remaining)} left of ₹${_formatNumber(budget)}',
                style: TextStyle(fontSize: 14, color: subTextColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: badgeBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      onTrack ? Icons.check : Icons.warning_amber_rounded,
                      size: 16,
                      color: badgeTextColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      onTrack ? 'On track' : 'Over budget',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: badgeTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatNumber(int n) {
    return n.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }
}