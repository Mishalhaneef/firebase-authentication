import 'package:firebase_setup/view-model/auth/auth_controller.dart';
import 'package:firebase_setup/view/widgets/button.dart';
import 'package:firebase_setup/view/widgets/textfield.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final authenticationProvider = AuthenticationProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
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
            password: true,
            controller: passwordController,
          ),
          const SizedBox(height: 50),
          Button(
            backgroundColor: Colors.blue,
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onTap: () async {
              await authenticationProvider.register(
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
