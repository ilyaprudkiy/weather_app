import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/feature/auth/presentation/sign_up_screen/cubit/sign_up_screen_cubit.dart';
import '../../../../core/buttons/app_buttons.dart';
import '../../../../navigation/navigation.dart';

class SignUpScreenWidget extends StatefulWidget {
  const SignUpScreenWidget({super.key});

  @override
  State<SignUpScreenWidget> createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: BackgroundPainter(),
          child: Stack(
            children: [
              const Positioned(
                  height: 70,
                  top: 200,
                  right: 100,
                  child: TextCreateAccountWidget()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButtonTextField(
                    controller: repeatPasswordController,
                    color: Colors.cyan,
                    hintText: 'Repeat password',
                    icon: Icons.perm_identity_outlined,
                    prefixIconColor: Colors.blue.shade800,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButtonTextField(
                    controller: emailController,
                    color: Colors.cyan,
                    hintText: 'Email',
                    icon: Icons.email,
                    prefixIconColor: Colors.blue.shade800,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButtonTextField(
                    controller: passwordController,
                    color: Colors.blueAccent,
                    hintText: 'Password',
                    icon: Icons.lock_open,
                    prefixIconColor: Colors.blue.shade800,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Positioned(
                      child: ButtonSignUpWidget(
                    email: emailController.text,
                    password: passwordController.text,
                    repeatPassword: repeatPasswordController.text,
                  )),
                ],
              )
            ],
          ),
        ));
  }
}

class TextCreateAccountWidget extends StatelessWidget {
  const TextCreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Create account',
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final paint = Paint();

    Path mainBackground = Path();
    mainBackground.lineTo(width, 0);
    mainBackground.lineTo(width, height * 0.65);
    mainBackground.cubicTo(width * 0.8, height * 0.8, width * 0.5, height * 0.8,
        width * 0.45, height);
    mainBackground.lineTo(0, height);

    paint.color = Colors.blue.shade800;
    canvas.drawPath(mainBackground, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ButtonSignUpWidget extends StatelessWidget {
  final String password;
  final String email;
  final String repeatPassword;

  const ButtonSignUpWidget(
      {super.key,
      required this.password,
      required this.email,
      required this.repeatPassword});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Container(
        height: 60,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: ElevatedButton(
            onPressed: () {
              cubit.signUp(password, email, repeatPassword);
              Navigator.of(context)
                  .pushNamed(MainNavigationRouteNames.weatherScreen);
            },
            child: Text('Sign up',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ))));
  }
}
