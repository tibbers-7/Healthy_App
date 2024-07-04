import 'package:flutter/material.dart';

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5;
    double dashSpace = 3;
    double startY = 0;

    final paint = Paint()
      ..color = const Color.fromRGBO(224, 224, 224, 1)
      ..strokeWidth = size.width; // Adjust the width of the line

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}