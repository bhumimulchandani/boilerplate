// import 'package:boilerplate/presentation/provider/bookprovider.dart';
// import 'package:boilerplate/presentation/views/login/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:provider/provider.dart';
// import 'package:boilerplate/presentation/routes/route_manager.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load();

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => BookProvider()),
//       ],
//       child: const MaterialApp(
//         onGenerateRoute: RouteManager.generateRoutes,
//         debugShowCheckedModeBanner: false,
//         home: SignUpScreen(),
//       ),
//     ),
//   );
// }
// import 'package:boilerplate/presentation/provider/auth_provider.dart';
// import 'package:boilerplate/presentation/provider/bookprovider.dart';
// import 'package:boilerplate/presentation/provider/language_provider.dart';
// import 'package:boilerplate/presentation/provider/themeprovider.dart';
// import 'package:boilerplate/presentation/routes/app_router.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   try {
//     await Firebase.initializeApp();
//     await dotenv.load();
//     debugPrint('Firebase and environment initialized successfully.');
//   } catch (e) {
//     debugPrint('Initialization error: $e');
//   }

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => LanguageProvider()),
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),
//         ChangeNotifierProvider(create: (_) => BookProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appRouter = AppRouter();

//     return Consumer2<ThemeProvider, LanguageProvider>(
//       builder: (context, themeProvider, languageProvider, child) {
//         return MaterialApp.router(
//           routerConfig: appRouter.config(),
//           debugShowCheckedModeBanner: false,
//           theme: themeProvider.lightTheme,
//           darkTheme: themeProvider.darkTheme,
//           themeMode: themeProvider.themeMode,
//           locale: languageProvider.locale ?? const Locale('en'),
//           localizationsDelegates: AppLocalizations.localizationsDelegates,
//           supportedLocales: AppLocalizations.supportedLocales,
//         );
//       },
//     );
//   }
// }
import 'package:boilerplate/presentation/riverpod/auth_notifier.dart';
import 'package:boilerplate/presentation/views/books/book_screen.dart';
import 'package:boilerplate/presentation/views/login/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:boilerplate/presentation/routes/app_router.dart';
import 'package:boilerplate/presentation/riverpod/theme_notifier.dart';
import 'package:boilerplate/presentation/riverpod/language_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    await dotenv.load();
    debugPrint('Firebase and environment initialized successfully.');
  } catch (e) {
    debugPrint('Initialization error: $e');
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialAppWidget();
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return Consumer(
      builder: (context, ref, _) {
        final themeMode = ref.watch(themeProvider);
        final locale = ref.watch(languageNotifierProvider) ??
            AppLocalizations.supportedLocales.first;

        final authState = ref.watch(authProvider);

        return MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // builder: (context, child) {
          //   return authState.isAuthenticated
          //       ? child ?? BookDetails()
          //       : child ?? const Signin();
          // },
        );
      },
    );
  }
}
