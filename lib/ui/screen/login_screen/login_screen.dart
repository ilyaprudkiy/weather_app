import 'package:flutter/material.dart';
import 'package:weather_app/ui/screen/login_screen/widgets/form_button_login_forgot_widget.dart';
import 'package:weather_app/ui/screen/login_screen/widgets/form_contienie_with_widget.dart';
import 'package:weather_app/ui/screen/login_screen/widgets/form_lodin_and_password_widget.dart';
import 'package:weather_app/ui/screen/login_screen/widgets/text_welcome_widget.dart';
import '../../constant/widgets/custom_painter.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const MyCustomPaint(
              radius: 150,
              size: Size(300, 300),
              width: 10,
              height: 10,
              left: 20),
          const MyCustomPaint(
            radius: 20,
            size: Size(150, 150),
            left: 300,
            top: 20,
          ),
          const MyCustomPaint(
            radius: 30,
            size: Size(200, 200),
            left: 330,
            top: 50,
          ),
          const MyCustomPaint(
            radius: 30,
            size: Size(200, 200),
            left: 200,
            top: 10,
          ),
          const TextWelcomeWidget(),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Column(
                  children: [
                    FormLoginAndPasswordWidget(
                        loginTextFieldController: loginTextFieldController,
                        passwordTextFieldController:
                            passwordTextFieldController),
                    const SizedBox(
                      height: 30,
                    ),
                    const FormButtonLoginForgotWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const FormContieniueWithWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
