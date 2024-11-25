// import 'package:flutter/material.dart';

// class AnimationManager {
//   static PageRouteBuilder slideTransition(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(1.0, 0.0);
//         const end = Offset.zero;
//         const curve = Curves.easeInOut;

//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(position: offsetAnimation, child: child);
//       },
//     );
//   }

//   static PageRouteBuilder fadeTransition(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     );
//   }

//   static PageRouteBuilder scaleTransition(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         var curve = Curves.easeInOut;
//         var tween =
//             Tween<double>(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));
//         var scaleAnimation = animation.drive(tween);

//         return ScaleTransition(scale: scaleAnimation, child: child);
//       },
//     );
//   }

//   static PageRouteBuilder customSlideAndShrinkTransition(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         var curve = Curves.easeInOut;

//         //shrink current screen
//         //sliding currrent screen to side
//         //fading new screen
//         var scaleTween =
//             Tween<double>(begin: 1.0, end: 0.9).chain(CurveTween(curve: curve));
//         var scaleAnimation = animation.drive(scaleTween);

//         var slideTween =
//             Tween<Offset>(begin: Offset.zero, end: const Offset(-0.0, -0.5))
//                 .chain(CurveTween(curve: curve));
//         var slideAnimation = animation.drive(slideTween);

//         var fadeTween =
//             Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
//         var fadeAnimation = animation.drive(fadeTween);

//         return Stack(
//           children: [
//             SlideTransition(
//               position: slideAnimation,
//               child: ScaleTransition(
//                 scale: scaleAnimation,
//                 child: child,
//               ),
//             ),
//             FadeTransition(
//               opacity: fadeAnimation,
//               child: page,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
