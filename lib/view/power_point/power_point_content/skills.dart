import 'dart:async';

import 'package:flutter/material.dart';




class Skills extends StatelessWidget {
  double height = 0;
  double width = 0;
  double size = 0;
  double progresBar = 0;
  int animationDuration = 500;
  var color = Colors.green;

  calculatorSize() {
    if(width >= height) {
      size = height;
    } else {
      size = width;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    calculatorSize();
    double containerWidth = size / 1.6;
    double padding = size / 237;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(size / 15, size / 18)),
            border: Border.all(color: color, width: 1,),
            color: Colors.black54
        ),
        height: size / 1.1,
        width: containerWidth,

        child: Column(
          children: [
            Container(
                width: containerWidth,
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: color))),
                child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Text("SKILLS",
                        style: TextStyle(
                            fontSize: size / 20,
                            color: color,
                            fontFamily: 'Modeseven'
                        ),
                      )
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(padding, padding * 5, padding, padding * 5),
              child: Column(
                children: [
                  createSkill(skill: "Flutter", percentLoaded: 100,),
                  createSkill(skill: "Kotlin", percentLoaded: 100,),
                  createSkill(skill: "Javascript", percentLoaded: 40,),
                  createSkill(skill: "Python", percentLoaded: 70,),
                  createSkill(skill: "Firebase", percentLoaded: 100,),
                  createSkill(skill: "Api", percentLoaded: 90,),
                  createSkill(skill: "MVVM", percentLoaded: 80,),
                  createSkill(skill: "RX", percentLoaded: 60,),
                  createSkill(skill: "Webview", percentLoaded: 90,),
                ],
              ),
            )
          ],
        )
    );
  }
}




class createSkill extends StatefulWidget {

  final double percentLoaded;
  final String skill;
  createSkill({required this.percentLoaded, required this.skill,});

  @override
  _createSkillState createState() => _createSkillState(percentLoaded, skill,);
}

class _createSkillState extends State<createSkill> {
  final double percentLoaded;
  final String skill;
  _createSkillState(this.percentLoaded, this.skill,);

  var color = Colors.green;

  double barLengthMinusNum = 0;
  double padding = 0;
  double skillPadding = 0;
  double progresBar = 0;
  double height = 0;
  double width = 0;
  double size = 0;

  int percentLoadedCounter = 0;
  int animationDuration = 2500;
  bool timerState = true;


  calculatorSize() {
    if(width >= height) {
      size = height;
    } else {
      size = width;
    }
  }

  text(int textSize, String text) {
    return Text(text,
      style: TextStyle(
          fontSize: size / textSize,
          color: color,
          fontFamily: 'Modeseven'
      ),
    );
  }

  animationTiming() {
    barLengthMinusNum = (100-percentLoaded) * (size / 400);
    padding = size / 237;
    skillPadding = padding * 2;
    Timer(Duration(milliseconds: 1), () => setState(() {
      progresBar = (size / 4) - barLengthMinusNum;
      setState(() {
        if (percentLoadedCounter <= percentLoaded - 1) {
          percentLoadedCounter++;
        } else {
          timerState = false;
        }
      });
    }));
    if(timerState) {
      Timer(Duration(milliseconds: 1700), () => setState(() {
        setState(() {
          animationDuration = 0;
        });
      }));
    }

  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    calculatorSize();

    animationTiming();

    return Padding(
      padding: EdgeInsets.fromLTRB(0, skillPadding, skillPadding, skillPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //this is the skill text
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, padding * 1.3, 0),
            child: text(35, "$skill:")
          ),
          //the skill percentage
          Padding(
            padding: EdgeInsets.fromLTRB(padding, 0, 0, 0),
            child: text(35, "{$percentLoadedCounter%} ")
          ),
          //the skill loading bar
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: animationDuration),
                  curve: Curves.decelerate,
                  color: color,
                  width: progresBar,
                  height: size / 60,
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: color)),
                width: size / 3.88,
                height: size / 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

