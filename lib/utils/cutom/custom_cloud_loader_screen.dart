
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint cloudPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withOpacity(0.8),
          Colors.white.withOpacity(0.4),
          Colors.transparent,
        ],
        stops: [0.3, 0.7, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.4),
        radius: size.width * 0.4,
      ))
      ..style = PaintingStyle.fill;

    // Основное облако (центральное)
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.4), // Центр
      size.width * 0.25, // Радиус
      cloudPaint,
    );

    // Дополнительные элементы облака (сглаживание краёв)
    canvas.drawCircle(
      Offset(size.width * 0.4, size.height * 0.35),
      size.width * 0.2,
      cloudPaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.35),
      size.width * 0.2,
      cloudPaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.45, size.height * 0.45),
      size.width * 0.15,
      cloudPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}