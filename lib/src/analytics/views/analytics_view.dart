import 'package:finarium/src/analytics/enums/analytics_period.dart';
import 'package:finarium/src/analytics/models/analytics_models.dart';
import 'package:finarium/src/analytics/widgets/monthly_spending_chart.dart';
import 'package:finarium/src/analytics/widgets/period_filter_chips.dart';
import 'package:finarium/src/analytics/widgets/spending_breakdown.dart';
import 'package:flutter/material.dart';

const _categoryShares = [
  CategoryShare(label: 'Food & dining', percent: 35, color: Color(0xFF1B6B5A)),
  CategoryShare(label: 'Shopping', percent: 25, color: Color(0xFF7CC4B0)),
  CategoryShare(label: 'Transport', percent: 18, color: Color(0xFFC47D0E)),
  CategoryShare(label: 'Bills & utilities', percent: 12, color: Color(0xFF4A5BA8)),
  CategoryShare(label: 'Other', percent: 10, color: Color(0xFF8A8F8C)),
];

const _monthlyTotals = [
  MonthlyTotal(label: 'May', amount: 28000),
  MonthlyTotal(label: 'Jun', amount: 33500),
  MonthlyTotal(label: 'Jul', amount: 26400),
  MonthlyTotal(label: 'Aug', amount: 37800),
  MonthlyTotal(label: 'Sep', amount: 31200),
  MonthlyTotal(label: 'Oct', amount: 42380),
];

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({super.key});

  @override
  State<AnalyticsView> createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  var _period = AnalyticsPeriod.thisMonth;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        PeriodFilterChips(
          selected: _period,
          onSelected: (period) => setState(() => _period = period),
        ),
        const SizedBox(height: 24),
        const SpendingBreakdown(total: '₹42,380', shares: _categoryShares),
        const SizedBox(height: 32),
        const MonthlySpendingChart(months: _monthlyTotals),
      ],
    );
  }
}
