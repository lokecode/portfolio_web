import 'package:flutter/material.dart';

class LineToPoint extends CustomPainter {
  @override
  //function to draw lines
  void paint(Canvas canvas, Size size) {
    double Size = size.height;
    double circularRadius = Size / 2.43;
    final center = Offset(size.width / 2, size.height / 2);

    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = Size / 30
      ..style = PaintingStyle.stroke;

    print(Size);

    final arc2 = Path();
    arc2.moveTo(Size - Size * 1.5, Size - Size * 1.75);
    arc2.arcToPoint(
        center,
        radius: Radius.circular(0)
    );
    canvas.drawPath(arc2, paint);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}