// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BudgetAllocation _$BudgetAllocationFromJson(Map<String, dynamic> json) =>
    _BudgetAllocation(
      category: json['category'] as String,
      amountMinor: (json['amountMinor'] as num).toInt(),
    );

Map<String, dynamic> _$BudgetAllocationToJson(_BudgetAllocation instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amountMinor': instance.amountMinor,
    };
