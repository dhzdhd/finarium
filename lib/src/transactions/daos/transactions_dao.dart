import 'package:drift/drift.dart';
import 'package:finarium/src/database.dart';
import 'package:finarium/src/transactions/models/merchant.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:finarium/src/transactions/tables/transactions_table.dart';
import 'package:fpdart/fpdart.dart' show Option;

part 'transactions_dao.g.dart';

@DriftAccessor(tables: [Transactions])
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  TransactionsDao(super.db);

  Stream<List<Transaction>> watchAll() {
    final query = select(transactions)
      ..orderBy([(t) => OrderingTerm.desc(t.occurredAt)]);
    return query.watch().map((rows) => rows.map(_transactionFromRow).toList());
  }

  Future<void> upsert(Transaction transaction) {
    return into(transactions)
        .insertOnConflictUpdate(_transactionCompanion(transaction));
  }

  Future<int> deleteById(String id) {
    return (delete(transactions)..where((t) => t.id.equals(id))).go();
  }
}

Transaction _transactionFromRow(TransactionRow row) {
  final merchant = switch (row.merchantName) {
    final name? => Merchant.named(name),
    null => const Merchant.unknown(),
  };
  final note = Option.fromNullable(row.note);

  return switch (row.kind) {
    TransactionKind.expense => Transaction.expense(
      id: row.id,
      amountMinor: row.amountMinor,
      merchant: merchant,
      category: row.category,
      paymentSource: row.paymentSource,
      captureSource: row.captureSource,
      occurredAt: row.occurredAt.toUtc(),
      createdAt: row.createdAt.toUtc(),
      updatedAt: row.updatedAt.toUtc(),
      currency: row.currency,
      note: note,
      receiptPath: Option.fromNullable(row.receiptPath),
    ),
    TransactionKind.income => Transaction.income(
      id: row.id,
      amountMinor: row.amountMinor,
      merchant: merchant,
      category: row.category,
      paymentSource: row.paymentSource,
      captureSource: row.captureSource,
      occurredAt: row.occurredAt.toUtc(),
      createdAt: row.createdAt.toUtc(),
      updatedAt: row.updatedAt.toUtc(),
      currency: row.currency,
      note: note,
      isRecurring: row.isRecurring,
    ),
    TransactionKind.subscription => Transaction.subscription(
      id: row.id,
      amountMinor: row.amountMinor,
      merchant: merchant,
      category: row.category,
      paymentSource: row.paymentSource,
      captureSource: row.captureSource,
      occurredAt: row.occurredAt.toUtc(),
      createdAt: row.createdAt.toUtc(),
      updatedAt: row.updatedAt.toUtc(),
      currency: row.currency,
      note: note,
      firstBillingDate: (row.firstBillingDate ?? row.occurredAt).toUtc(),
      frequency: row.frequency ?? SubscriptionFrequency.monthly,
      endDate: Option.fromNullable(row.endDate?.toUtc()),
      autoRenew: row.autoRenew,
      reminder: row.reminder ?? SubscriptionReminder.none,
    ),
  };
}

TransactionsCompanion _transactionCompanion(Transaction transaction) {
  final base = TransactionsCompanion(
    id: Value(transaction.id),
    kind: Value(_kindOf(transaction)),
    amountMinor: Value(transaction.amountMinor),
    merchantName: Value(switch (transaction.merchant) {
      NamedMerchant(:final name) => name,
      UnknownMerchant() => null,
    }),
    category: Value(transaction.category),
    paymentSource: Value(transaction.paymentSource),
    captureSource: Value(transaction.captureSource),
    occurredAt: Value(transaction.occurredAt),
    createdAt: Value(transaction.createdAt),
    updatedAt: Value(transaction.updatedAt),
    currency: Value(transaction.currency),
    note: Value(transaction.note.toNullable()),
  );

  return switch (transaction) {
    ExpenseTransaction(:final receiptPath) => base.copyWith(
      receiptPath: Value(receiptPath.toNullable()),
    ),
    IncomeTransaction(:final isRecurring) => base.copyWith(
      isRecurring: Value(isRecurring),
    ),
    SubscriptionTransaction(
      :final firstBillingDate,
      :final frequency,
      :final endDate,
      :final autoRenew,
      :final reminder,
    ) =>
      base.copyWith(
        firstBillingDate: Value(firstBillingDate),
        frequency: Value(frequency),
        endDate: Value(endDate.toNullable()),
        autoRenew: Value(autoRenew),
        reminder: Value(reminder),
      ),
  };
}

TransactionKind _kindOf(Transaction transaction) => switch (transaction) {
  ExpenseTransaction() => TransactionKind.expense,
  IncomeTransaction() => TransactionKind.income,
  SubscriptionTransaction() => TransactionKind.subscription,
};
