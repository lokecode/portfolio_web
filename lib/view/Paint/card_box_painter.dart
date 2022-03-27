import 'package:flutter/material.dart';


class CardBoxPainter extends CustomPainter {

  @override
  //function to draw lines
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = height / 440;

    // left side line
    canvas.drawLine(
      //line start point, x and y coordinates
      Offset(0, 0),
      //line end point, x and y coordinates
      Offset(0, height * 5.0 / 6),
      paint,
    );

    //right side line
    canvas.drawLine(
      //line start point, x and y coordinates
      Offset(width - 1, height / 10),
      //line end point, x and y coordinates
      Offset(width, height),
      paint,
    );

    canvas.drawLine(
      //line start point, x and y coordinates
      Offset(0, height * 5 / 6),
      //line end point, x and y coordinates
      Offset(width / 3, height),
      paint,
    );

    canvas.drawLine(
      //line start point, x and y coordinates
      Offset(width * 4 / 5, 0),
      //line end point, x and y coordinates
      Offset(width, height / 10),
      paint,
    );

    //bottom line
    canvas.drawLine(
      //line start point, x and y coordinates
      Offset(width / 3.0, height),
      //line end point, x and y coordinates
      Offset(width, height),
      paint,
    );

    //top line
    canvas.drawLine(
      //line start point, x and y coordinates
      Offset(0, 0),
      //line end point, x and y coordinates
      Offset(width * 4 / 5, 0),
      paint,
    );

    // line under HUMAN SPECS text
    canvas.drawLine(
      //line start point, x and y coordinates
      Offset(0, height / 10),
      //line end point, x and y coordinates
      Offset(width, height / 10),
      paint,
    );

  }

  //defining if the CustomPainter should redraw or not
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;


}