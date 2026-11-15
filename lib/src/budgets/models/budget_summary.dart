import 'package:finarium/src/budgets/enums/budget_period.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:flutter/material.dart' show DateTimeRange, DateUtils;

enum BudgetStatus { onTrack, nearLimit, overLimit }

class CategoryProgress {
  const CategoryProgress({
    required this.category,
    required this.spentMinor,
    required this.limitMinor,
  });

  final String category;
  final int spentMinor;
  final int limitMinor;

  double get fraction => limitMinor == 0 ? 0 : spentMinor / limitMinor;

  int get percent => (fraction * 100).round();

  BudgetStatus get status {
    if (fraction >= 1) return BudgetStatus.overLimit;
    if (fraction >= 0.8) return BudgetStatus.nearLimit;
    return BudgetStatus.onTrack;
  }
}

class BudgetSummary {
  const BudgetSummary({
    required this.start,
    required this.end,
    required this.spentMinor,
    required this.limitMinor,
    required this.projectedMinor,
    required this.daysLeft,
    required this.categories,
  });

  final DateTime start;
  final DateTime end;
  final int spentMinor;
  final int limitMinor;
  final int projectedMinor;
  final int daysLeft;
  final List<CategoryProgress> categories;

  int get leftMinor => limitMinor - spentMinor;

  Iterable<CategoryProgress> get overLimit =>
      categories.where((c) => c.status == BudgetStatus.overLimit);
}

({DateTime start, DateTime end}) budgetWindow(
  BudgetPeriod period,
  DateTime now, {
  DateTime? customStart,
  DateTime? customEnd,
}) {
  final today = DateTime(now.year, now.month, now.day);
  final weekStart = today.subtract(Duration(days: today.weekday - 1));
  return switch (period) {
    BudgetPeriod.monthly => (
      start: DateTime(now.year, now.month),
      end: DateTime(now.year, now.month + 1),
    ),
    BudgetPeriod.weekly => (
      start: weekStart,
      end: weekStart.add(const Duration(days: 7)),
    ),
    BudgetPeriod.custom => (
      start: customStart ?? today,
      end: (customEnd ?? today).add(const Duration(days: 1)),
    ),
  };
}

DateTimeRange? planCustomRange(BudgetPlan plan) {
  final start = plan.customStart.toNullable()?.toLocal();
  final end = plan.customEnd.toNullable()?.toLocal();
  if (start == null || end == null) return null;
  return DateTimeRange(start: start, end: end);
}

BudgetPlan? findBudgetPlan(
  List<BudgetPlan> plans,
  BudgetPeriod period,
  DateTimeRange? custom,
) {
  final matches = plans.where((plan) {
    if (plan.period != period) return false;
    if (period != BudgetPeriod.custom) return true;
    final range = planCustomRange(plan);
    return custom != null &&
        range != null &&
        DateUtils.isSameDay(range.start, custom.start) &&
        DateUtils.isSameDay(range.end, custom.end);
  });

  return matches.fold<BudgetPlan?>(
    null,
    (latest, plan) =>
        latest == null || plan.updatedAt.isAfter(latest.updatedAt)
        ? plan
        : latest,
  );
}

BudgetSummary buildBudgetSummary({
  required BudgetPlan plan,
  required List<Transaction> transactions,
  required DateTime now,
}) {
  final range = planCustomRange(plan);
  final window = budgetWindow(
    plan.period,
    now,
    customStart: range?.start,
    customEnd: range?.end,
  );
  final totalDays = window.end.difference(window.start).inDays;
  final elapsed = (now.difference(window.start).inDays + 1).clamp(
    1,
    totalDays,
  );
  final daysLeft = window.end.difference(now).inDays.clamp(0, totalDays);

  final spending = transactions.where(
    (t) =>
        t is! IncomeTransaction &&
        !t.occurredAt.isBefore(window.start) &&
        t.occurredAt.isBefore(window.end),
  );

  int spentFor(String category) {
    final key = category.trim().toLowerCase();
    return spending
        .where((t) => t.category.trim().toLowerCase() == key)
        .fold(0, (sum, t) => sum + t.amountMinor);
  }

  final categories = [
    for (final allocation in plan.allocations)
      CategoryProgress(
        category: allocation.category,
        spentMinor: spentFor(allocation.category),
        limitMinor: allocation.amountMinor,
      ),
  ]..sort((a, b) => b.fraction.compareTo(a.fraction));

  final spentMinor = spending.fold(0, (sum, t) => sum + t.amountMinor);

  return BudgetSummary(
    start: window.start,
    end: window.end,
    spentMinor: spentMinor,
    limitMinor: plan.totalMinor,
    projectedMinor: (spentMinor * totalDays / elapsed).round(),
    daysLeft: daysLeft,
    categories: categories,
  );
}
