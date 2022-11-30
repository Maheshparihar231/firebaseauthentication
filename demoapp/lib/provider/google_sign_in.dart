import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googlesignin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleuser = await googlesignin.signIn();
      if (googleuser == null) return;
      _user = googleuser;

      final googleauth = await googleuser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleauth.accessToken,
        idToken: googleauth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await googlesignin.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
