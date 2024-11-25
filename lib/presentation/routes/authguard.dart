import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boilerplate/presentation/provider/auth_provider.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final currentRoute = resolver.route.name;

    final isAuthenticated = Provider.of<AuthProvider>(
      router.navigatorKey.currentContext!,
      listen: true,
    ).isAuthenticated;

    if (currentRoute == 'BookDetails' && !isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: router.navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: const Text('Not Authenticated'),
              content: const Text('Please sign in to access this page.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      });

      resolver.next(false);
    } else {
      resolver.next();
    }
  }
}
