import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_web/view/power_point/power_point_content/about.dart';
import 'package:portfolio_web/view/power_point/power_point_content/projects.dart';
import 'package:portfolio_web/view/power_point/power_point_content/skills.dart';

import 'package:portfolio_web/view/power_point/rotate_power_point.dart';



class ThreeDimensionalObject extends StatefulWidget {


  @override
  ThreeDimensionalObjectState createState() => ThreeDimensionalObjectState();
}

class ThreeDimensionalObjectState extends State<ThreeDimensionalObject> {

  double dragPosistion = 0;
  double height = 1000;
  double width = 1000;
  double size = 0;
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


  imageChose() {
    int imageFileName = (dragPosistion / 48).toInt();
    threeDimensionalObject = manPictures[imageFileName];
  }

  calculatorSize() {
    if(width >= height) {
      size = height;
      widgetWidth = width - size / 2.4;
      screenChange = 500;
      columnAliment = MainAxisAlignment.center;
    } else {
      size = width;
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



  @override
  Widget build(BuildContext context) {
    imageChose();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    calculatorSize();
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
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 30, -230, false,'PROJECTS', Projects(), 28]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 230, 0, false,'SKILLS', Skills(), 23]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 130, 270, false,'ABOUT', About(), 20.5]),
                    AnimatedContainer(
                      duration: const Duration(microseconds: 0),
                      alignment: const Alignment(0, 0),
                      child: threeDimensionalObject,
                    ),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 30, -230, true,'PROJECTS', Projects(), 28]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 230, 0, true,'SKILLS', Skills(), 23]),
                    RotatePowerPoint(ListOfData: [dragPosistion, height, width, size, screenChange, 130, 270, true,'ABOUT', About(), 20.5]),
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
