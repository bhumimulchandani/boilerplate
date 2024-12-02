import 'package:boilerplate/data/repositories/shared_preference_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final sharedPref = SharedPreferenceImpl();

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken);

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        userCredential.user!.updateDisplayName(googleUser.displayName);
        sharedPref.storeData("email", userCredential.user!.email!);

        // Navigator.pushNamed(context, AppRoutes.auth);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Login Failed",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      return userCredential.user;
    } catch (e) {
      print("Error Occured While Google Login:$e");
      return null;
    }
  }

  Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
