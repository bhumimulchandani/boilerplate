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

import 'package:boilerplate/presentation/provider/auth_provider.dart';
import 'package:boilerplate/presentation/provider/bookprovider.dart';
import 'package:boilerplate/presentation/provider/themeprovider.dart';
import 'package:boilerplate/presentation/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BookProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      // home: const SignUpScreen(),
    );
  }
}
