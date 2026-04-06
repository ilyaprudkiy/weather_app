import 'package:flutter/material.dart';
import '../../../../../core/buttons/app_buttons.dart';

class FormLoginAndPasswordWidget extends StatelessWidget {
  const FormLoginAndPasswordWidget({
    super.key,
    required this.loginTextFieldController,
    required this.passwordTextFieldController,
  });

  final TextEditingController loginTextFieldController;
  final TextEditingController passwordTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButtonTextField(
            controller: loginTextFieldController,
            color: Colors.white,
            hintText: 'Login',
            icon: Icons.perm_identity_outlined,
            prefixIconColor: Colors.blueAccent),
        const SizedBox(
          height: 15,
        ),
        AppButtonTextField(
            controller: passwordTextFieldController,
            color: Colors.white,
            hintText: 'Password',
            icon: Icons.lock_open,
            prefixIconColor: Colors.blueAccent),
      ],
    );
  }
}
