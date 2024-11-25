// import 'package:auto_route/auto_route.dart';
// import 'package:boilerplate/presentation/animation/animation_manager.dart';
// import 'package:boilerplate/presentation/routes/app_router.gr.dart';

// @AutoRouterConfig()
// class AppRouter extends $AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//         CustomRoute(
//           page: SignUp.page,
//           initial: true,
//           transitionsBuilder: slideTransition,
//         ),
//         CustomRoute(
//           page: Signin.page,
//           transitionsBuilder: slideTransition,
//         ),
//         CustomRoute(
//           page: BookDetails.page,
//           transitionsBuilder: slideTransition,
//         ),
//         CustomRoute(
//           page: DummyRoute.page,
//           transitionsBuilder: fadeTransition,
//         ),
//       ];
// }
import 'package:auto_route/auto_route.dart';
import 'package:boilerplate/presentation/animation/animation_manager.dart';
import 'package:boilerplate/presentation/routes/app_router.gr.dart';
import 'package:boilerplate/presentation/routes/authguard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        _buildRoute(SignUp.page, initial: true),
        _buildRoute(Signin.page),
        _buildRoute(BookDetails.page, guards: [AuthGuard()]), // AuthGuard for BookDetails
        _buildRoute(DummyRoute.page),
      ];

  CustomRoute _buildRoute(page, {bool initial = false, List<AutoRouteGuard> guards = const []}) {
    return CustomRoute(
      page: page,
      initial: initial,
      guards: guards,  // Ensure guards are added
      transitionsBuilder: fadeTransition,
    );
  }
}
