import 'dart:developer';

import 'package:firebase_setup/services/auth/firebase_auth_fasade.dart';
import 'package:firebase_setup/snackbar.dart';
import 'package:firebase_setup/view/home/home.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();

  Future login(String email, String password, BuildContext context) async {
    try {
      if (email.isEmpty) {
        snackBar(context, 'Enter Email');
      } else if (password.isEmpty) {
        snackBar(context, 'Enter Password');
      } else {
        final userEmail = await firebaseAuthService.signinWithEmailAndPassword(
            email, password);
        if (context.mounted) {
          if (userEmail != null) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Home(),
            ));
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future register(String email, String password, BuildContext context) async {
    try {
      if (email.isEmpty) {
        snackBar(context, 'Enter Email');
      } else if (password.isEmpty) {
        snackBar(context, 'Enter Password');
      } else {
        final userEmail = await firebaseAuthService
            .registerWithEmailAndPassword(email, password);
        if (userEmail != null) {
          if (context.mounted) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Home(),
            ));
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
