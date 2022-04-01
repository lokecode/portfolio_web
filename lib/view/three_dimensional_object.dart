import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_web/view/power_point/power_point_content/about.dart';
import 'package:portfolio_web/view/power_point/power_point_content/projects.dart';
import 'package:portfolio_web/view/power_point/power_point_content/skills.dart';

import 'package:portfolio_web/view/power_point/rotate_power_point.dart';



class ThreeDimensionalObject extends StatefulWidget {
  double height = 0;
  double width = 0;
  double size = 0;
  ThreeDimensionalObject({required this.height, required this.width, required this.size});

  @override
  ThreeDimensionalObjectState createState() => ThreeDimensionalObjectState();
}

class ThreeDimensionalObjectState extends State<ThreeDimensionalObject> {
  double height = 900;
  double width = 900;
  double size = 0;

  double dragPosistion = 360;
  double widgetWidth = 0;
  double screenChange = 0;
  List manPictures = [
    Image.asset('assets/0.png'),
    Image.asset('assets/1.png'),
    Image.asset('assets/2.png'),
    Image.asset('assets/3.png'),
    Image.asset('assets/4.png'),
    Image.asset('assets/5.png'),
    Image.asset('assets/6.png'),
    Image.asset('assets/7.png'),
  ];
  var threeDimensionalObject = Image.asset('assets/0.png');
  var rowAliment = MainAxisAlignment.end;
  var columnAliment = MainAxisAlignment.center;
  int animationDuration = 0;
  bool runIncrement = true;


  imageChose() {
    int imageFileName = (dragPosistion / 48).toInt();
    threeDimensionalObject = manPictures[imageFileName];
  }

  calculatorSize() {
    if(width >= height) {
      widgetWidth = width - size / 2.4;
      screenChange = 500;
      columnAliment = MainAxisAlignment.center;
    } else {
      widgetWidth = width;
      screenChange = width;
      columnAliment = MainAxisAlignment.start;
    }

    if(height <= width * 1.15 && width <= height * 1.15) {
      animationDuration = 500;
    } else {
      animationDuration = 0;
    }
  }

  increment() {
    Timer(Duration(milliseconds: 1), () => setState(() {
      dragPosistion -= 4;
      if(dragPosistion <= 2) {
        dragPosistion = 0;
        runIncrement = false;
      }
    }));
  }


  @override
  Widget build(BuildContext context) {
    height = widget.height;
    width = widget.width;
    size = widget.size;
    calculatorSize();
    imageChose();
    if (runIncrement) {
      increment();
    }
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: columnAliment,
          children: [
            Container(
              width: widgetWidth,
              height: height / 2,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) => setState(() {
                  dragPosistion -= details.delta.dx;
                  dragPosistion %= 360;
                }),
                child: Stack(
                  children: [
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 30, -230, false,'PROJECTS', Projects(height: widget.height, width: widget.width, size: widget.size,), 28]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 230, 0, false,'SKILLS', Skills(height: height, width: width, size: size,), 23]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 130, 270, false,'ABOUT ME', About(height: height, width: width, size: size,), 27.8]),
                    AnimatedContainer(
                      duration: const Duration(microseconds: 0),
                      alignment: const Alignment(0, 0),
                      child: threeDimensionalObject,
                    ),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 30, -230, true,'PROJECTS', Projects(height: height, width: width, size: size,), 28]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 230, 0, true,'SKILLS', Skills(height: height, width: width, size: size,), 23]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 130, 270, true,'ABOUT ME', About(height: height, width: width, size: size,), 27.8]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
