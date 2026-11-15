import 'package:finarium/src/budgets/widgets/add_budget_sheet.dart';
import 'package:finarium/src/cards/widgets/add_card_dialog.dart';
import 'package:finarium/src/core/breakpoints.dart';
import 'package:finarium/src/routes.dart';
import 'package:finarium/src/settings/controllers/settings_controller.dart';
import 'package:finarium/src/settings/theme.dart';
import 'package:finarium/src/transactions/widgets/add_transaction_sheet.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FinariumApp extends ConsumerWidget {
  const FinariumApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(
      settingsControllerProvider.select(
        (settings) => settings.value?.themeMode ?? ThemeMode.system,
      ),
    );
    return MaterialApp.router(
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
    );
  }
}

class NavScaffold extends ConsumerWidget {
  const NavScaffold({super.key, required this.navShell});

  final StatefulNavigationShell navShell;

  void _goBranch(int index) {
    navShell.goBranch(
      index,
      initialLocation: index == navShell.currentIndex,
    );
  }

  PreferredSizeWidget? _appBar(Route route) {
    if (route is CategoriesRoute) return null;
    return AppBar(title: Text(route.name));
  }

  Widget? _floatingActionButton(BuildContext context, Route route) {
    return switch (route) {
      TransactionsRoute() => FloatingActionButton.extended(
        label: const Text('Add transaction'),
        icon: const Icon(Icons.add),
        onPressed: () => AddTransactionSheet.show(context),
      ),
      CardsRoute() => FloatingActionButton.extended(
        label: const Text('Add card'),
        icon: const Icon(Icons.add),
        onPressed: () => AddCardDialog.show(context),
      ),
      BudgetsRoute() => FloatingActionButton.extended(
        label: const Text('Add budget'),
        icon: const Icon(Icons.add),
        onPressed: () => AddBudgetSheet.show(context),
      ),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = routes.elementAt(navShell.currentIndex);
    final width = MediaQuery.sizeOf(context).width;

    if (width < Breakpoints.desktop) {
      return Scaffold(
        appBar: _appBar(currentRoute),
        body: navShell,
        floatingActionButton: _floatingActionButton(context, currentRoute),
        bottomNavigationBar: NavigationBar(
          selectedIndex: navShell.currentIndex,
          onDestinationSelected: _goBranch,
          destinations: [
            for (final route in routes)
              NavigationDestination(
                icon: route.icon,
                selectedIcon: route.selectedIcon,
                label: route.name,
              ),
          ],
        ),
      );
    }

    final extended = width >= Breakpoints.xl;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: extended,
            labelType: extended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.all,
            selectedIndex: navShell.currentIndex,
            onDestinationSelected: _goBranch,
            leading: _railLeading(context, extended),
            destinations: [
              for (final route in routes)
                NavigationRailDestination(
                  icon: route.icon,
                  selectedIcon: route.selectedIcon,
                  label: Text(route.name),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Scaffold(
              appBar: _appBar(currentRoute),
              body: navShell,
              floatingActionButton: _floatingActionButton(context, currentRoute),
            ),
          ),
        ],
      ),
    );
  }

  Widget _railLeading(BuildContext context, bool extended) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    if (!extended) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Icon(Icons.savings_outlined, color: color),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.savings_outlined, color: color),
          const SizedBox(width: 12),
          Text(
            'Finarium',
            style: theme.textTheme.titleMedium?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
