import 'package:firebase_setup/view-model/auth/auth_controller.dart';
import 'package:firebase_setup/view/widgets/button.dart';
import 'package:firebase_setup/view/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final authenticationProvider = AuthenticationProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            hint: 'email',
            controller: emailController,
          ),
          AppTextField(
            hint: 'password',
            controller: passwordController,
            password: true,
          ),
          const SizedBox(height: 50),
          Button(
            backgroundColor: Colors.blue,
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () async {
              await authenticationProvider.login(
                emailController.text,
                passwordController.text,
                context,
              );
            },
          )
        ],
      ),
    );
  }
}
