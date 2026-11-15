import 'package:finarium/src/budgets/enums/budget_period.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';

part 'budget_plan.freezed.dart';
part 'budget_plan.g.dart';

@freezed
abstract class BudgetAllocation with _$BudgetAllocation {
  const factory BudgetAllocation({
    required String category,
    required int amountMinor,
  }) = _BudgetAllocation;

  factory BudgetAllocation.fromJson(Map<String, dynamic> json) =>
      _$BudgetAllocationFromJson(json);
}

@freezed
abstract class BudgetPlan with _$BudgetPlan {
  const factory BudgetPlan({
    required String id,
    required BudgetPeriod period,
    required int totalMinor,
    required List<BudgetAllocation> allocations,
    @Default(None()) Option<DateTime> customStart,
    @Default(None()) Option<DateTime> customEnd,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BudgetPlan;
}
