import 'package:finarium/src/transactions/models/option_json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

enum SubscriptionFrequency { daily, weekly, monthly, quarterly, yearly }

enum SubscriptionReminder { none, sameDay, oneDay, threeDays, oneWeek }

@freezed
sealed class Transaction with _$Transaction {
  const factory Transaction.expense({
    required String id,
    required int amountMinor,
    required String merchant,
    required String category,
    required String paymentSource,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default('INR') String currency,
    @OptionStringConverter() @Default(None()) Option<String> note,
    @OptionStringConverter() @Default(None()) Option<String> receiptPath,
  }) = ExpenseTransaction;

  const factory Transaction.income({
    required String id,
    required int amountMinor,
    required String merchant,
    required String category,
    required String paymentSource,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default('INR') String currency,
    @OptionStringConverter() @Default(None()) Option<String> note,
    @Default(false) bool isRecurring,
  }) = IncomeTransaction;

  const factory Transaction.subscription({
    required String id,
    required int amountMinor,
    required String merchant,
    required String category,
    required String paymentSource,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime firstBillingDate,
    required SubscriptionFrequency frequency,
    @Default('INR') String currency,
    @OptionDateTimeConverter() @Default(None()) Option<DateTime> endDate,
    @OptionStringConverter() @Default(None()) Option<String> note,
    @Default(true) bool autoRenew,
    @Default(SubscriptionReminder.oneDay) SubscriptionReminder reminder,
  }) = SubscriptionTransaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
