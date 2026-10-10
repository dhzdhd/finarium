import 'package:finarium/src/transactions/views/transaction_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

sealed class Route {
  String get routeName;
  Widget call();
}

final class TransactionsRoute() implements Route {
  @override
  String get routeName => 'transactions';

  @override
  Widget call() => TransactionView();
}

final class SettingsRoute() implements Route {
  @override
  String get routeName => 'settings';

  @override
  Widget call() => TransactionView();
}

final class CardsRoute() implements Route {
  @override
  String get routeName => 'cards';

  @override
  Widget call() => TransactionView();
}

final class BudgetsRoute() implements Route {
  @override
  String get routeName => 'budgets';

  @override
  Widget call() => TransactionView();
}

final class AnalyticsRoute() implements Route {
  @override
  String get routeName => 'analytics';

  @override
  Widget call() => TransactionView();
}

final routes = [
  TransactionsRoute(),
  CardsRoute(),
  BudgetsRoute(),
  AnalyticsRoute(),
  SettingsRoute(),
];
final router = GoRouter(
  routes: routes
      .map((e) => GoRoute(path: e.routeName, builder: (context, state) => e()))
      .toList(),
);
