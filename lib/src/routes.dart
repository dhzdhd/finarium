import 'package:finarium/src/analytics/views/analytics_view.dart';
import 'package:finarium/src/cards/views/cards_view.dart';
import 'package:finarium/src/app.dart';
import 'package:finarium/src/settings/views/settings_view.dart';
import 'package:finarium/src/transactions/views/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

sealed class Route {
  String get name;
  String get path;
  Icon get icon;
  Icon get selectedIcon;
  Widget call();
}

final class TransactionsRoute() implements Route {
  @override
  String get name => 'Transactions';

  @override
  String get path => '/';

  @override
  Icon get icon => const Icon(Icons.list_alt_outlined);

  @override
  Icon get selectedIcon => const Icon(Icons.list_alt);

  @override
  Widget call() => TransactionView();
}

final class SettingsRoute() implements Route {
  @override
  String get name => 'Settings';

  @override
  String get path => '/settings';

  @override
  Icon get icon => const Icon(Icons.settings_outlined);

  @override
  Icon get selectedIcon => const Icon(Icons.settings);

  @override
  Widget call() => SettingsView();
}

final class CardsRoute() implements Route {
  @override
  String get name => 'Cards';

  @override
  String get path => '/cards';

  @override
  Icon get icon => const Icon(Icons.credit_card_outlined);

  @override
  Icon get selectedIcon => const Icon(Icons.credit_card);

  @override
  Widget call() => CardsView();
}

final class BudgetsRoute() implements Route {
  @override
  String get name => 'Budgets';

  @override
  String get path => '/budgets';

  @override
  Icon get icon => const Icon(Icons.account_balance_wallet_outlined);

  @override
  Icon get selectedIcon => const Icon(Icons.account_balance_wallet);

  @override
  Widget call() => TransactionView();
}

final class AnalyticsRoute() implements Route {
  @override
  String get name => 'Analytics';

  @override
  String get path => '/analytics';

  @override
  Icon get icon => const Icon(Icons.analytics_outlined);

  @override
  Icon get selectedIcon => const Icon(Icons.analytics);

  @override
  Widget call() => AnalyticsView();
}

final routes = [
  TransactionsRoute(),
  CardsRoute(),
  BudgetsRoute(),
  AnalyticsRoute(),
  SettingsRoute(),
];

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: TransactionsRoute().path,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (ctx, state, child) {
        return NavScaffold(navShell: child);
      },
      branches: routes
          .map(
            (e) => StatefulShellBranch(
              routes: [GoRoute(path: e.path, builder: (context, state) => e())],
            ),
          )
          .toList(),
    ),
  ],
);
