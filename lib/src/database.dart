import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart' show driftDatabase;
import 'package:finarium/src/budgets/daos/budgets_dao.dart';
import 'package:finarium/src/budgets/enums/budget_period.dart';
import 'package:finarium/src/budgets/models/budget_plan.dart' show BudgetAllocation;
import 'package:finarium/src/budgets/tables/budget_plans_table.dart';
import 'package:finarium/src/categories/daos/categories_dao.dart';
import 'package:finarium/src/categories/tables/categories_table.dart';
import 'package:finarium/src/cards/daos/cards_dao.dart';
import 'package:finarium/src/cards/tables/bank_cards_table.dart';
import 'package:finarium/src/settings/daos/settings_dao.dart';
import 'package:finarium/src/settings/enums/auto_lock_duration.dart';
import 'package:finarium/src/settings/enums/budget_alert_threshold.dart';
import 'package:finarium/src/settings/tables/app_settings_table.dart';
import 'package:finarium/src/transactions/daos/transactions_dao.dart';
import 'package:finarium/src/transactions/enums/capture_source.dart';
import 'package:finarium/src/transactions/models/transaction.dart'
    show SubscriptionFrequency, SubscriptionReminder;
import 'package:finarium/src/transactions/tables/transactions_table.dart';
import 'package:flutter/material.dart' show ThemeMode;

part 'database.g.dart';

@DriftDatabase(
  tables: [Transactions, BankCards, AppSettings, BudgetPlans, Categories],
  daos: [
    TransactionsDao,
    CardsDao,
    SettingsDao,
    BudgetsDao,
    CategoriesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'finarium'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(appSettings);
      }
      if (from < 4) {
        await customStatement('DROP TABLE IF EXISTS budgets');
        await m.createTable(budgetPlans);
      }
      if (from < 5) {
        await m.createTable(categories);
      }
      if (from == 5) {
        await m.alterTable(TableMigration(categories));
      }
    },
  );
}
