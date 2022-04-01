import 'package:flutter/material.dart';
import 'package:portfolio_web/view/Paint/card_box_painter.dart';

class InformationCard extends StatelessWidget {
  double height = 0;
  double width = 0;
  double cardSize = 0;
  InformationCard({required this.height, required this.width, required this.cardSize});

  double cardYpos = 0;
  double cardXpos = -0.85;
  double cardWidth = -0.85;
  int animationDuration = 0;
  var alignment = MainAxisAlignment.center;


  calculatorCardSize() {
    if(width >= height) {

      cardYpos = 0;
      alignment = MainAxisAlignment.center;
    } else {

      cardYpos = 1;
      alignment = MainAxisAlignment.end;
    }

    if(height <= width * 1.6 && width <= height * 1.6) {
      animationDuration = 500;
    } else {
      animationDuration = 0;
    }
  }

  informationCardContent(String humanSpecification) {
    return Container(
        height: height / 15 - cardYpos * 15,
        child: Row(
          children: [
            Text(" $humanSpecification", style: TextStyle(color: Colors.green, fontSize: height / 24, fontFamily: 'Modeseven'),)
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    calculatorCardSize();
    double cardHeight = height / (1.2 + cardYpos / 1.2);
    double cardWidth = cardSize / (2.4 - cardYpos * 1.398);
    return Column(
      mainAxisAlignment: alignment,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(width / 50, 0, width / 50, 0),
          child: AnimatedContainer(
              duration: Duration(milliseconds: animationDuration),
              height: cardHeight,
              width: cardWidth,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: height / (2.4 - cardYpos * 2.4),
                      child: CustomPaint(
                        foregroundPainter: CardBoxPainter(),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(cardWidth / 25, 0, cardWidth / 5, 0),
                          //SingleChildScrollView used to not get renderFlex error
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                height: height / 12 - cardYpos * 22,
                                width: cardWidth / 1.25,
                                child: Center(
                                  child:  Text("HUMAN SPECS", style: TextStyle(color: Colors.green, fontSize: height / 22, fontFamily: 'Modeseven'),),
                                )
                            ),
                          ),
                        ),
                        informationCardContent("MODEL: LOKE Z"),
                        informationCardContent("AGE: 23"),
                        informationCardContent("HEIGHT: 180"),
                        informationCardContent("WEIGHT: 77"),
                        informationCardContent("IQ: 130"),
                        informationCardContent("MUSCLE: 40%"),
                      ],
                    )
                  ],
                ),
              )
          ),
        ),
      ],
    );
  }
}

