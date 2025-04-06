import 'package:flutter/cupertino.dart';

class MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const  Color(0xFF4A2E8C);

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.2, size.height * 0.7)
      ..lineTo(size.width * 0.4, size.height * 0.8)
      ..lineTo(size.width * 0.6, size.height * 0.6)
      ..lineTo(size.width * 0.8, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}