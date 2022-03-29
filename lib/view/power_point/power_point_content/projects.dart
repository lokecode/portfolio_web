import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:portfolio_web/view/loading_animation/portfolio_animation.dart';


class Projects extends StatefulWidget {

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double height = 0;
  double width = 0;
  double size = 0;
  double padding = 0;
  double dragPosistion = 0;
  double dragPosistionInstance = 0;
  int time = 0;
  int animationDuration = 500;
  var color = Colors.green;
  bool posistionAtWidget = true;

  calculatorSize() {

    if(width >= height) {
      size = height;
    } else {
      size = width;
    }
  }

  timer() {
    Timer(const Duration(milliseconds: 20), () => setState(() {
      time += 1;
    }));
  }

  basicText(int textSize, String text) {
    return Text(text,
      style: TextStyle(
        fontSize: size / textSize,
        color: color,
        fontFamily: 'Modeseven',
      ),
    );
  }

  autoPosistionWidget() {

    setState(() {
      dragPosistion = 0;
    });

  }

  text(int textSize, String text) {
    String animatedText = '';
    if(time <= text.characters.length) {
      animatedText = text.substring(0, time);
    } else {
      animatedText = text;
    }

    return Text(animatedText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size / textSize,
        color: color,
        fontFamily: 'Modeseven',
      ),
    );
  }

  descriptionText(int textSize, String text) {
    String animatedText = '';
    if(time <= text.characters.length) {
      animatedText = text.substring(0, time);
    } else {
      animatedText = text;
    }

    return Text(animatedText,
      style: TextStyle(
        fontSize: size / textSize,
        color: color,
        fontFamily: 'Modeseven',
      ),
    );
  }

  phoneTemplet(String image, double phoneHeight){
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(size / 40)),
              border: Border.all(color: color, width: 1,),
            ),
            child: Padding(
              padding:  EdgeInsets.fromLTRB(padding * 4, padding * 10, padding * 4, padding * 10),
              child: Container(
                height: size / (phoneHeight + (phoneHeight / 7.5)),
                decoration: BoxDecoration(
                  border: Border.all(color: color, width: size / 500,),
                ),
                child: Image.asset(image),
              ),
            )
        ),
      ],
    );
  }

  fluentTranslate(String project, String descriptionHeader, String description){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, padding * 8, 0, 0),
          child: basicText(20, project),
        ),
        phoneTemplet("assets/fluent-translate.jpg", 1.5),
        Padding(
          padding: EdgeInsets.fromLTRB(0, size / 50, 0, size / 150),
          child: descriptionText(30, descriptionHeader),
        ),
        text(40, description),
      ],
    );
  }

  webViewPlatform(String project, String description){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, padding, padding * 5, padding * 3),
              child: basicText(20, project),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            phoneTemplet("assets/web-view-platform.jpg", 1.5),
            Padding(
                padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
                child: Column(
                  children: [
                    descriptionText(35, description)
                  ],
                )
            )
          ],
        ),
      ],
    );
  }

  instagramClone(String project, String description){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, padding, padding * 5, padding * 3),
              child: basicText(20, project),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(size /80, 0, size /80, size /30),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  phoneTemplet("assets/instagram-clone.png", 1.7),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      descriptionText(35, description)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    calculatorSize();
    padding = size / 237;
    timer();
    if(posistionAtWidget) {
      autoPosistionWidget();
    }
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(size / 15, size / 18)),
            border: Border.all(color: color, width: 1,),
            color: Colors.black54
        ),
        width: size / 1.6,
        child: Stack(
          children: [
            GestureDetector(
              onHorizontalDragUpdate: (details) => setState(() {
                dragPosistion -= details.delta.dx;
                dragPosistion %= 360;
                posistionAtWidget = false;
              }),
              onHorizontalDragEnd: (details) => setState(() {
                posistionAtWidget = true;
              }),
              child: Stack(
                children: [
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        alignment: Alignment(0, 0),
                        child: fluentTranslate(
                          "Fluent Translate",
                          "World First",
                          "Fluent translation application\nWhen a person speaks, it translates\ninstantly into your language",
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        alignment: Alignment(dragPosistion, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(size / 75, size / 30, 0, size / 30),
                          child: webViewPlatform(
                            "webview apps",
                            "webview app\nplatform.\nit was made so\nthat you easily,\ncould make your\nwebsite into\n"
                                "an webview app,\nwithout having\nan android\ndeveloper\naccount.\nyou can make\nan user account.\n"
                                "and save as many\nwebview apps,\nas you want.\n"
                                "the app was made\nin flutter.\nusing firebase\nauthentication\nto store users,\nand firebase\n"
                                "firestore\nfor web apps"
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        alignment: Alignment(dragPosistion, 0),
                        child: instagramClone(
                          "Instagram Clone",
                          "The clone\nwas made to\nshow of my\nskills in\nkotlin.\nThe clone\nuses\nFirebase as\na database,"
                              "\nand MVVM as\ncoding\narchitecture\nin the clone\nyou can\nupload fotos\nmake post"
                              "\nand you\ncan login\nand signup\nyou can also\nsee other\nusers post",
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}



