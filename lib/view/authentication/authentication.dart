import 'package:firebase_setup/view/authentication/login.dart';
import 'package:firebase_setup/view/authentication/registration.dart';
import 'package:firebase_setup/view/widgets/button.dart';
import 'package:flutter/material.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            borderColor: Colors.blue,
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            },
          ),
          const SizedBox(height: 20),
          Button(
            backgroundColor: Colors.blue,
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ));
            },
          )
        ],
      ),
    );
  }
}
