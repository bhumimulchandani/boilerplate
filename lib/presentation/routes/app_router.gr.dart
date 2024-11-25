// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:boilerplate/presentation/views/books/book_screen.dart' as _i1;
import 'package:boilerplate/presentation/views/dummy_page.dart' as _i2;
import 'package:boilerplate/presentation/views/login/signin.dart' as _i4;
import 'package:boilerplate/presentation/views/login/signup.dart' as _i3;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    BookDetails.name: (routeData) {
      final args = routeData.argsAs<BookDetailsArgs>(
          orElse: () => const BookDetailsArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BookDetails(key: args.key),
      );
    },
    DummyRoute.name: (routeData) {
      final args = routeData.argsAs<DummyRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DummyPage(
          key: args.key,
          userID: args.userID,
          username: args.username,
        ),
      );
    },
    SignUp.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUp(),
      );
    },
    Signin.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Signin(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookDetails]
class BookDetails extends _i5.PageRouteInfo<BookDetailsArgs> {
  BookDetails({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BookDetails.name,
          args: BookDetailsArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BookDetails';

  static const _i5.PageInfo<BookDetailsArgs> page =
      _i5.PageInfo<BookDetailsArgs>(name);
}

class BookDetailsArgs {
  const BookDetailsArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'BookDetailsArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DummyPage]
class DummyRoute extends _i5.PageRouteInfo<DummyRouteArgs> {
  DummyRoute({
    _i6.Key? key,
    required int userID,
    required String username,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          DummyRoute.name,
          args: DummyRouteArgs(
            key: key,
            userID: userID,
            username: username,
          ),
          initialChildren: children,
        );

  static const String name = 'DummyRoute';

  static const _i5.PageInfo<DummyRouteArgs> page =
      _i5.PageInfo<DummyRouteArgs>(name);
}

class DummyRouteArgs {
  const DummyRouteArgs({
    this.key,
    required this.userID,
    required this.username,
  });

  final _i6.Key? key;

  final int userID;

  final String username;

  @override
  String toString() {
    return 'DummyRouteArgs{key: $key, userID: $userID, username: $username}';
  }
}

/// generated route for
/// [_i3.SignUp]
class SignUp extends _i5.PageRouteInfo<void> {
  const SignUp({List<_i5.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Signin]
class Signin extends _i5.PageRouteInfo<void> {
  const Signin({List<_i5.PageRouteInfo>? children})
      : super(
          Signin.name,
          initialChildren: children,
        );

  static const String name = 'Signin';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
