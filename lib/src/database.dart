import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart' show driftDatabase;
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
  tables: [Transactions, BankCards, AppSettings],
  daos: [TransactionsDao, CardsDao, SettingsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'finarium'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;
}
