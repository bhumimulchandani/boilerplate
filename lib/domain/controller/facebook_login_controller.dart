import "package:auto_route/auto_route.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_facebook_auth/flutter_facebook_auth.dart";
// import "package:sample_app/core/constants/app_routes.dart";

class FacebookLoginController {
  final FacebookAuth faceBookAuth = FacebookAuth.instance;

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await faceBookAuth.login();

      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);

        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        if (userCredential.user != null) {
          userCredential.user!
              .updateDisplayName(userCredential.user!.displayName);
          print(userCredential.user!.email);
          context.pushRoute(
            const PageRouteInfo(''
                // AppRoutes.navigation,
                ),
          );
          // Navigator.pushNamed(context, AppRoutes.navigation);
        }
      } else {
        print("Facebook login failed: ${result.status}");
        return;
      }
    } catch (e) {
      print("Error during Facebook login: $e");
      return;
    }
  }

  Future<void> facebookSignOut() async {
    await faceBookAuth.logOut();
  }
}
