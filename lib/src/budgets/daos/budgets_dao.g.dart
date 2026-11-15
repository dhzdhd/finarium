// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgets_dao.dart';

// ignore_for_file: type=lint
mixin _$BudgetsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BudgetPlansTable get budgetPlans => attachedDatabase.budgetPlans;
  BudgetsDaoManager get managers => BudgetsDaoManager(this);
}

class BudgetsDaoManager {
  final _$BudgetsDaoMixin _db;
  BudgetsDaoManager(this._db);
  $$BudgetPlansTableTableManager get budgetPlans =>
      $$BudgetPlansTableTableManager(_db.attachedDatabase, _db.budgetPlans);
}
