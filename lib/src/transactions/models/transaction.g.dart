// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseTransaction _$ExpenseTransactionFromJson(Map<String, dynamic> json) =>
    ExpenseTransaction(
      id: json['id'] as String,
      amountMinor: (json['amountMinor'] as num).toInt(),
      merchant: json['merchant'] as String,
      category: json['category'] as String,
      paymentSource: json['paymentSource'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      currency: json['currency'] as String? ?? 'INR',
      note: json['note'] == null
          ? const None()
          : const OptionStringConverter().fromJson(json['note'] as String?),
      receiptPath: json['receiptPath'] == null
          ? const None()
          : const OptionStringConverter().fromJson(
              json['receiptPath'] as String?,
            ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ExpenseTransactionToJson(ExpenseTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amountMinor': instance.amountMinor,
      'merchant': instance.merchant,
      'category': instance.category,
      'paymentSource': instance.paymentSource,
      'occurredAt': instance.occurredAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'currency': instance.currency,
      'note': const OptionStringConverter().toJson(instance.note),
      'receiptPath': const OptionStringConverter().toJson(instance.receiptPath),
      'runtimeType': instance.$type,
    };

IncomeTransaction _$IncomeTransactionFromJson(Map<String, dynamic> json) =>
    IncomeTransaction(
      id: json['id'] as String,
      amountMinor: (json['amountMinor'] as num).toInt(),
      merchant: json['merchant'] as String,
      category: json['category'] as String,
      paymentSource: json['paymentSource'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      currency: json['currency'] as String? ?? 'INR',
      note: json['note'] == null
          ? const None()
          : const OptionStringConverter().fromJson(json['note'] as String?),
      isRecurring: json['isRecurring'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$IncomeTransactionToJson(IncomeTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amountMinor': instance.amountMinor,
      'merchant': instance.merchant,
      'category': instance.category,
      'paymentSource': instance.paymentSource,
      'occurredAt': instance.occurredAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'currency': instance.currency,
      'note': const OptionStringConverter().toJson(instance.note),
      'isRecurring': instance.isRecurring,
      'runtimeType': instance.$type,
    };

SubscriptionTransaction _$SubscriptionTransactionFromJson(
  Map<String, dynamic> json,
) => SubscriptionTransaction(
  id: json['id'] as String,
  amountMinor: (json['amountMinor'] as num).toInt(),
  merchant: json['merchant'] as String,
  category: json['category'] as String,
  paymentSource: json['paymentSource'] as String,
  occurredAt: DateTime.parse(json['occurredAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  firstBillingDate: DateTime.parse(json['firstBillingDate'] as String),
  frequency: $enumDecode(_$SubscriptionFrequencyEnumMap, json['frequency']),
  currency: json['currency'] as String? ?? 'INR',
  endDate: json['endDate'] == null
      ? const None()
      : const OptionDateTimeConverter().fromJson(json['endDate'] as String?),
  note: json['note'] == null
      ? const None()
      : const OptionStringConverter().fromJson(json['note'] as String?),
  autoRenew: json['autoRenew'] as bool? ?? true,
  reminder:
      $enumDecodeNullable(_$SubscriptionReminderEnumMap, json['reminder']) ??
      SubscriptionReminder.oneDay,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SubscriptionTransactionToJson(
  SubscriptionTransaction instance,
) => <String, dynamic>{
  'id': instance.id,
  'amountMinor': instance.amountMinor,
  'merchant': instance.merchant,
  'category': instance.category,
  'paymentSource': instance.paymentSource,
  'occurredAt': instance.occurredAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'firstBillingDate': instance.firstBillingDate.toIso8601String(),
  'frequency': _$SubscriptionFrequencyEnumMap[instance.frequency]!,
  'currency': instance.currency,
  'endDate': const OptionDateTimeConverter().toJson(instance.endDate),
  'note': const OptionStringConverter().toJson(instance.note),
  'autoRenew': instance.autoRenew,
  'reminder': _$SubscriptionReminderEnumMap[instance.reminder]!,
  'runtimeType': instance.$type,
};

const _$SubscriptionFrequencyEnumMap = {
  SubscriptionFrequency.daily: 'daily',
  SubscriptionFrequency.weekly: 'weekly',
  SubscriptionFrequency.monthly: 'monthly',
  SubscriptionFrequency.quarterly: 'quarterly',
  SubscriptionFrequency.yearly: 'yearly',
};

const _$SubscriptionReminderEnumMap = {
  SubscriptionReminder.none: 'none',
  SubscriptionReminder.sameDay: 'sameDay',
  SubscriptionReminder.oneDay: 'oneDay',
  SubscriptionReminder.threeDays: 'threeDays',
  SubscriptionReminder.oneWeek: 'oneWeek',
};
