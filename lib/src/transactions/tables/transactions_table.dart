import 'package:drift/drift.dart';
import 'package:finarium/src/transactions/enums/capture_source.dart';
import 'package:finarium/src/transactions/models/transaction.dart';

enum TransactionKind { expense, income, subscription }

@DataClassName('TransactionRow')
class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get kind => textEnum<TransactionKind>()();
  IntColumn get amountMinor => integer()();
  TextColumn get merchantName => text().nullable()();
  TextColumn get category => text()();
  TextColumn get paymentSource => text()();
  TextColumn get captureSource => textEnum<CaptureSource>()();
  DateTimeColumn get occurredAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get currency => text().withDefault(const Constant('INR'))();
  TextColumn get note => text().nullable()();

  TextColumn get receiptPath => text().nullable()();

  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();

  DateTimeColumn get firstBillingDate => dateTime().nullable()();
  TextColumn get frequency => textEnum<SubscriptionFrequency>().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  BoolColumn get autoRenew => boolean().withDefault(const Constant(true))();
  TextColumn get reminder => textEnum<SubscriptionReminder>().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
