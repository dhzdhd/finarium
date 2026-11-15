import 'package:finarium/src/budgets/daos/budgets_dao.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart';
import 'package:finarium/src/core/database_provider.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budgets_controller.g.dart';

final _log = Logger('BudgetsController');

@riverpod
BudgetsDao budgetsDao(Ref ref) => ref.watch(appDatabaseProvider).budgetsDao;

@riverpod
class BudgetsController extends _$BudgetsController {
  @override
  Stream<List<BudgetPlan>> build() {
    return ref.watch(budgetsDaoProvider).watchAll();
  }

  Future<void> save(BudgetPlan plan) async {
    try {
      await ref.read(budgetsDaoProvider).upsert(plan);
    } catch (error, stackTrace) {
      _log.severe('Could not save budget ${plan.id}', error, stackTrace);
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      await ref.read(budgetsDaoProvider).deleteById(id);
    } catch (error, stackTrace) {
      _log.severe('Could not delete budget $id', error, stackTrace);
      rethrow;
    }
  }
}
