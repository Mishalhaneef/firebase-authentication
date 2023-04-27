import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup/services/auth/failure/auth_failure.dart';
import 'package:firebase_setup/services/auth/auth_service.dart';

class FirebaseAuthService implements AuthenticationService {
  final failure = AuthFailure();

  @override
  Future<String?> registerWithEmailAndPassword(
      String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user!.email;
    } on FirebaseAuthException catch (e) {
      final error = failure.registrationFailures(e);
      log(error);
      return null;
    }
  }

  @override
  Future<String?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user!.email;
    } on FirebaseException catch (e) {
      final error = failure.loginFailures(e);
      log(error);
      return null;
    }
  }

  @override
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
