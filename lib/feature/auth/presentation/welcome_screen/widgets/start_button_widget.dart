import 'package:flutter/material.dart';
import 'package:weather_app/feature/auth/presentation/cubit/auth_cubit.dart';
import '../../../../../navigation/navigation.dart';


class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
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
            'Sign up',
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

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
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
