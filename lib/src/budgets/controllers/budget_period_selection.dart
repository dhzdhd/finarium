import 'package:finarium/src/budgets/enums/budget_period.dart';
import 'package:flutter/material.dart' show DateTimeRange;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_period_selection.g.dart';

@Riverpod(keepAlive: true)
class BudgetPeriodSelection extends _$BudgetPeriodSelection {
  @override
  ({BudgetPeriod period, DateTimeRange? custom}) build() =>
      (period: BudgetPeriod.monthly, custom: null);

  void choose(BudgetPeriod period, {DateTimeRange? custom}) {
    state = (period: period, custom: custom);
  }
}
