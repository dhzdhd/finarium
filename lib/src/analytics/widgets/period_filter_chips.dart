import 'package:finarium/src/analytics/enums/analytics_period.dart';
import 'package:flutter/material.dart';

class PeriodFilterChips extends StatelessWidget {
  const PeriodFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final AnalyticsPeriod selected;
  final ValueChanged<AnalyticsPeriod> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          for (final period in AnalyticsPeriod.values)
            FilterChip(
              label: Text(period.label),
              selected: period == selected,
              showCheckmark: true,
              onSelected: (_) => onSelected(period),
            ),
        ],
      ),
    );
  }
}
