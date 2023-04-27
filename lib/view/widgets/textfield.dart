import 'package:firebase_setup/view-model/text_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.hint,
    this.password = false,
  });

  final TextEditingController? controller;
  final String? hint;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Consumer<TextFieldController>(
        builder: (context, value, child) => TextField(
            controller: controller,
            obscureText: password == true ? value.obscureText : false,
            decoration: InputDecoration(
                hintText: hint,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: password
                    ? IconButton(
                        icon: Icon(value.obscureText
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye),
                        onPressed: () {
                          value.toggleShowPassword();
                        },
                      )
                    : null)),
      ),
    ));
  }
}
