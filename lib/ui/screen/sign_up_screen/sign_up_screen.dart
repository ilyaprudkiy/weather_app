import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../buttons/app_buttons.dart';


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
                    hintText: 'Name',
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
                  const Positioned(child: ButtonSignUpWidget()),
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

    // Path blueWave = Path();
    // blueWave.lineTo(width, 0);
    // blueWave.lineTo(width, height * 0.65);
    // blueWave.cubicTo(width * 0.8, height * 0.8, width * 0.5, height * 0.8,
    //     width * 0.45, height);
    // blueWave.lineTo(0, height);
    // blueWave.close();
    // paint.color = Colors.blue.shade800;
    // canvas.drawPath(blueWave, paint);
    //
    // Path greyWave = Path();
    // greyWave.lineTo(width, 0);
    // greyWave.lineTo(width, height * 0.3);
    // greyWave.cubicTo(width * 0.65, height * 0.45, width * 0.25, height * 0.35,
    //     0, height * 0.5);
    // greyWave.close();
    // paint.color = Colors.grey.shade800;
    // canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ButtonSignUpWidget extends StatelessWidget {
  const ButtonSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: ElevatedButton(
            onPressed: () {},
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
