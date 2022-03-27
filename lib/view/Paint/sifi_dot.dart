import 'package:flutter/material.dart';


class SifiDot extends CustomPainter {

  @override
  //function to draw lines
  void paint(Canvas canvas, Size size) {
    double Size = size.height;
    double circularRadius = Size / 2.43;
    final center = Offset(size.width / 2, size.height / 2);

    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = Size / 50
      ..style = PaintingStyle.stroke;

    var paint2 = Paint()
      ..color = Colors.green
      ..strokeWidth = Size / 13
      ..style = PaintingStyle.stroke;

    var paint3 = Paint()
      ..color = Colors.green
      ..strokeWidth = Size / 33
      ..style = PaintingStyle.stroke;

    var paintCircle = Paint()
      ..color = Colors.green
      ..strokeWidth = Size / Size
      ..style = PaintingStyle.stroke;

    // Left top corner lines
    final arc1 = Path();
    arc1.moveTo(Size / 8, Size / 4);
    arc1.arcToPoint(
      Offset(Size / 2.1, Size / 15),
      radius: Radius.circular(circularRadius)
    );
    canvas.drawPath(arc1, paint);


    final arc2 = Path();
    arc2.moveTo(Size / 10.5, Size / 2.24);
    arc2.arcToPoint(
        Offset(Size / 2.35, Size / 9.5),
        radius: Radius.circular(circularRadius)
    );
    canvas.drawPath(arc2, paint2);


    // Right side lines
    final arc3 = Path();
    arc3.moveTo(Size / 1.25, Size / 5);
    arc3.arcToPoint(
        Offset(Size / 1.11, Size / 1.6),
        radius: Radius.circular(circularRadius)
    );
    canvas.drawPath(arc3, paint2);

    final arc4 = Path();
    arc4.moveTo(Size / 1.5, Size / 6.4);
    arc4.arcToPoint(
        Offset(Size / 1.2, Size / 1.47),
        radius: Radius.circular(circularRadius / 1.05)
    );
    canvas.drawPath(arc4, paint3);

    // Bottom side lines
    final arc5 = Path();
    arc5.moveTo(Size / 20, Size / 1.6);
    arc5.arcToPoint(
        Offset(Size / 1.44, Size / 1.09),
        clockwise: false,
        radius: Radius.circular(circularRadius * 1.22)
    );
    canvas.drawPath(arc5, paint);

    final arc6 = Path();
    arc6.moveTo(Size / 5.1, Size / 1.3);
    arc6.arcToPoint(
        Offset(Size / 1.6, Size / 1.13),
        clockwise: false,
        radius: Radius.circular(circularRadius)
    );
    canvas.drawPath(arc6, paint2);


    // inner circle
    canvas.drawCircle(
      center,
      size.width / 2.9,
      paintCircle,
    );




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}