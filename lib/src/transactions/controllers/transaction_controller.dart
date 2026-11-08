import 'package:finarium/src/core/database_provider.dart';
import 'package:finarium/src/transactions/daos/transactions_dao.dart';
import 'package:finarium/src/transactions/models/transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_controller.g.dart';

@riverpod
TransactionsDao transactionsDao(Ref ref) =>
    ref.watch(appDatabaseProvider).transactionsDao;

@riverpod
class TransactionsController extends _$TransactionsController {
  @override
  Stream<List<Transaction>> build() {
    return ref.watch(transactionsDaoProvider).watchAll();
  }

  Future<void> save(Transaction transaction) {
    return ref.read(transactionsDaoProvider).upsert(transaction);
  }

  Future<void> delete(String id) {
    return ref.read(transactionsDaoProvider).deleteById(id);
  }
}
