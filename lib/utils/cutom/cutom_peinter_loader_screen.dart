import 'package:flutter/cupertino.dart';

class SunPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..shader = const  RadialGradient(
      colors: [
        Color(0xFFFFD700), // Яркое солнце
        Color(0x00FFD700), // Плавное затухание
      ],
    ).createShader(Rect.fromCircle(
      center: Offset(size.width / 1, size.height / 1),
      radius: 200,
    ));

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 3),
      200,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}