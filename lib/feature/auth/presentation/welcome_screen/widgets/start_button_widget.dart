import 'package:flutter/material.dart';
import '../../../../../navigation/navigation.dart';
import '../cubit/welcome_screen_cubit.dart';

class SingUpButtonWidget extends StatelessWidget {
  const SingUpButtonWidget({
    super.key,
    required this.cubit,
  });

  final WelcomeScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(colors: [
              Color(0xFF8DA7C3),
              Color(0xFFAFC1D6),
            ])),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(160, 50),
            maximumSize: const Size(180, 70),

            // Цвет текста
            backgroundColor: Colors.blue.withOpacity(0.6),
            // Цвет кнопки
            shadowColor: const Color.fromRGBO(26, 119, 243, 3),
            // Тень кнопки
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(MainNavigationRouteNames.signUpScreen);
          },
          child: const Text(
            'Sing up',
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.cubit,
  });

  final WelcomeScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(colors: [
              Colors.white,
              Color(0xFFAFC1D6),
            ])),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(160, 50),
            maximumSize: const Size(180, 70),

            // Цвет текста
            backgroundColor: Colors.transparent,
            // Цвет кнопки
            shadowColor: Colors.transparent,
            // Тень кнопки
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(MainNavigationRouteNames.loginScreen);
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.blue[300],
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
