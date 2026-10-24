import 'package:finarium/src/routes.dart';
import 'package:finarium/src/settings/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FinariumApp extends ConsumerWidget {
  const FinariumApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = routes.elementAt(navShell.currentIndex);
    final isTransactionRoute = switch (currentRoute) {
      TransactionsRoute() => true,
      _ => false,
    };

    return Scaffold(
      appBar: AppBar(title: Text(currentRoute.name)),
      body: navShell,
      floatingActionButton: Visibility(
        visible: isTransactionRoute,
        child: FloatingActionButton.extended(
          label: Text('Add transaction'),
          icon: Icon(Icons.add),
          onPressed: null,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navShell.currentIndex,
        onDestinationSelected: (idx) => navShell.goBranch(
          idx,
          initialLocation: idx == navShell.currentIndex,
        ),
        destinations: routes
            .map(
              (e) => NavigationDestination(
                icon: e.icon,
                selectedIcon: e.selectedIcon,
                label: e.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
