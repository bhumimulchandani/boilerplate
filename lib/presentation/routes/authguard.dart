import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/presentation/riverpod/auth_notifier.dart';
import 'package:boilerplate/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = ProviderScope.containerOf(
      router.navigatorKey.currentContext!,
    ).read(authProvider).isAuthenticated;

    if (!isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: router.navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: const Text('Not Authenticated'),
              content: const Text('Please sign in to access this page.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    router.push(const Signin());
                  },
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

