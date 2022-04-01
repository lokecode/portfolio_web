import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:portfolio_web/view/Paint/line_to_point.dart';
import 'package:portfolio_web/view/Paint/sifi_dot.dart';
import 'package:portfolio_web/view/power_point/content_scrollable.dart';

class RotatePowerPoint extends StatelessWidget {
  final List ListOfData;
  RotatePowerPoint({required this.ListOfData,});

  double dotSize = 100;
  double dotPosistion = 0;

  double dragPosistion = 0;
  double height = 0;
  dynamic width = 0;
  dynamic size = 0;
  dynamic screenChange = 0;
  dynamic dotXPos = 0;
  dynamic dotYPos = 0;
  dynamic widgetPos = false;
  dynamic pointLabel = "";
  double width2 = 0;
  double rotate = 0;
  double animatedPointMovement = 0;
  double containerWidth = 0;
  dynamic pointRightPos;
  dynamic pointLeftPos;
  bool widgetVisibility = true;
  bool pointVisibility = true;
  bool animatedPointVisibility = false;
  MainAxisAlignment pointLabelAlignment = MainAxisAlignment.start;



  pointText(String pointLabel){
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: size / 700),
            color: Colors.black
        ),
        child: Text(pointLabel, style: TextStyle(color: Colors.green, fontSize:  dotSize * 2, fontFamily: 'Modeseven', backgroundColor: Colors.black54),)
    );
  }

  rotatingSifiDow() {
    dragPosistion = ListOfData[0];
    height = ListOfData[1];
    width = ListOfData[2];
    size = ListOfData[3];
    screenChange = ListOfData[4];
    dotXPos = ListOfData[5];
    dotYPos = ListOfData[6];
    widgetPos = ListOfData[7];
    pointLabel = ListOfData[8];
    containerWidth = ListOfData[10];

    double dotPosistionReversed = 530 - dragPosistion;
    double dragXPos = dragPosistion + dotXPos;
    double dotSizeDivider =  5 - height / 400;
    double dotDragPos = 0;
    double xPosMinusNumber = 0;
    double xPosMinusNumber2 = 540;
    double canvasHeight = height / 1.4;
    width2 = width - size / 3;

    if(dragXPos >= 360) {
      dotDragPos = dragXPos - 360;
    } else {
      dotDragPos = dragXPos;
    }


    if (dotDragPos >= 180) {
      dotSize = dotDragPos / dotSizeDivider;
      dotSize = canvasHeight / dotSize;
      rotate = dotDragPos / 14.15;

      pointVisibility = false;
      animatedPointMovement = 1300 - dotDragPos * 6.3 - (containerWidth - containerWidth / 3);

      pointLabelAlignment = MainAxisAlignment.end;
      pointRightPos = null;
      pointLeftPos  = dotSize * 18.2 - 2;
    } else {
      double dotMinSize = 360 - dotDragPos;
      dotSize = dotMinSize / dotSizeDivider;
      dotSize = canvasHeight / dotSize;
      rotate = 20 - dotDragPos / 16;

      animatedPointMovement = (dotDragPos + 10) * 3.4 - (containerWidth - containerWidth / 3) ;
      pointVisibility = false;

      pointLabelAlignment = MainAxisAlignment.start;
      pointRightPos = dotSize * 17.7 - 2;
      pointLeftPos  = null;
    }


    if (dotDragPos >= 200){
      rotate = 14.05;
      pointVisibility = true;
    }
    if (dotDragPos >= 20 && dotDragPos <= 179){
      rotate = 0.15;
      pointVisibility = true;
    }


    if (dotDragPos >= 270) {
      xPosMinusNumber = dotDragPos;
    } else {
      xPosMinusNumber = dragXPos;
    }

    if (dragXPos <= 89) {
      if (dotDragPos >= 270) {
        xPosMinusNumber2 = 540;
      } else {
        xPosMinusNumber2 = 180;
      }
    }

    if(pointVisibility == true) {
      animatedPointVisibility = false;
    } else {
      animatedPointVisibility = true;
    }

    if(dotDragPos <= 90 || dotDragPos >= 270) {
      dotPosistionReversed = xPosMinusNumber2 - xPosMinusNumber;
      if(widgetPos == true) {
        widgetVisibility = false;
      } else {
        widgetVisibility = true;
      }
    } else {
      dotPosistionReversed = dotDragPos;
      if(widgetPos == true) {
        widgetVisibility = true;
      } else {
        widgetVisibility = false;
      }
    }

    dotPosistion = -185 + dotPosistionReversed;
    if(dotPosistion >= 100){
      dotPosistion = -545 + dotPosistionReversed;
    }
  }

  void _showDialog(var context) {
    var PowerPointContent = ListOfData[9];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(child: MakeContentScrollable(content: PowerPointContent,));
        });
  }



  @override
  Widget build(BuildContext context) {
    rotatingSifiDow();
    return Stack(
      children: [
        AnimatedContainer(
            duration: const Duration(microseconds: 0),
            alignment: Alignment(dotPosistion / width2 * size / (screenChange / 2) , dotYPos / 360),
            child: Stack(
              children: [
                Container(
                  height: dotSize * 9.2,
                  width: dotSize * containerWidth,
                  child: Stack(
                    children: [
                      Visibility(
                        visible: widgetVisibility,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Transform.rotate(
                                angle: dragPosistion / 10,
                                child: SizedBox(
                                    height: dotSize * 4,
                                    width: dotSize * 4,
                                    child: CustomPaint(foregroundPainter: SifiDot())
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: widgetVisibility,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                                child: Transform.rotate(
                                  angle: rotate,
                                  child: SizedBox(
                                    height: dotSize * 4,
                                    width: dotSize * 6.5,
                                    child: CustomPaint(foregroundPainter: LineToPoint()),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Visibility(
                          visible: pointVisibility,
                          child: Stack(
                            children: [
                              Visibility(
                                visible: widgetVisibility,
                                child: Row(
                                  mainAxisAlignment: pointLabelAlignment,
                                  children: [
                                    pointText("$pointLabel"),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: pointLabelAlignment,
                                children: [
                                  Container(
                                    width: dotSize * 10,
                                    height: dotSize * 2.5,
                                    child: FlatButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        _showDialog(context);
                                      },
                                      child: Text("    "),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                      ),
                      Visibility(
                        visible: widgetVisibility,
                        child: Visibility(
                          visible: animatedPointVisibility,
                          child: Stack(
                            children: [
                              Positioned(
                                right: animatedPointMovement,
                                child: pointText("$pointLabel"),
                              ),
                              Positioned(
                                right: animatedPointMovement,
                                child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    color: Colors.transparent,
                                    onPressed: () {
                                      _showDialog(context);
                                    },
                                    child: Text("   ")
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }
}








