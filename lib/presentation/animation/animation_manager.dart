import 'package:flutter/material.dart';

Widget fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}

Widget slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final tween = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);
  final offsetAnimation = tween.animate(animation);
  return SlideTransition(position: offsetAnimation, child: child);
}
