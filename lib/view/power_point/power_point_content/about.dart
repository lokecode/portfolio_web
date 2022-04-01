import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio_web/view/Paint/sifi_dot.dart';
import 'package:flutter_svg/flutter_svg.dart';

class About extends StatefulWidget {
  double height = 0;
  double width = 0;
  double size = 0;
  About({required this.height, required this.width, required this.size});


  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  var time = 0.0;
  var opacity = Colors.black;
  bool Animation = true;
  double widgetWidth = 0;


  startAnimation(){
    Timer(Duration(milliseconds: 10), () => setState(() {
      opacity = Colors.transparent;
    }));
  }

  endAnimation(){
    Timer(Duration(milliseconds: 500), () => setState(() {
      Animation = false;
      widgetWidth = widget.size / 1.3;
    }));
  }



  @override
  Widget build(BuildContext context) {
    if(Animation) {
      widgetWidth = widget.width;
      startAnimation();
      endAnimation();
    }
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              width: widgetWidth,
              child: Center(
                child: _SubClass(height: widget.height, width: widget.width, size: widget.size,),
              ),
            ),
            Visibility(
              visible: Animation,
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(widget.size / 15, widget.size / 18)),
                    color: opacity,
                  ),
                  width: widget.size / 1.2,
                  height: widget.size / 1.1,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}






class _SubClass extends StatefulWidget {
  double height = 0;
  double width = 0;
  double size = 0;
  _SubClass({required this.height, required this.width, required this.size});

  @override
  State<_SubClass> createState() => _SubClassState();
}

class _SubClassState extends State<_SubClass> {
  double height = 0;
  double width = 0;
  double size = 0;
  int time = 0;
  var color = Colors.green;


  badgeTemplete(String picture, String text) {
    return Container(
        child: Column(
          children: [
            Container(
              width:  size / 8.3,
              child: Image.asset(picture),
            ),
            Text(text,
              style: TextStyle(
                fontSize: size / (48 + text.characters.length * 2),
                color: color,
                fontFamily: 'Modeseven',
              ),
            ),
          ],
        )
    );
  }


  addSideBarItem(String svg, String url){
    return RaisedButton(
      onPressed: () {launch(url);},
      color: Colors.transparent,
      padding: EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(size / 250, size / 100, size / 250, 0),
        child: SvgPicture.asset(svg, color: color,),
      ),
    );
  }

  increment(){
    Timer(Duration(milliseconds: 5), () => setState(() {
      time += 1;
    }));
  }

  textAnimation(String text) {
    String animatedText = '';
    if (time <= text.characters.length) {
      animatedText = text.substring(0, time);
    } else {
      animatedText = text;
    }

    return Text(animatedText,
      style: TextStyle(
        fontSize: size / 33,
        color: color,
        fontFamily: 'Modeseven',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = widget.height;
    width = widget.width;
    size = widget.size;
    double containerWidth = size / 1.4;
    increment();
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(size / 15, size / 18)),
            border: Border.all(color: color, width: 1,),
            color: Colors.black54
        ),
        width: containerWidth,
        child: Row(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size / 15, 0, 0),
                      child: Transform.rotate(
                        angle: (time / 40),
                        child: Container(
                          height: size / 3,
                          width:  size / 3,
                          child: CustomPaint(foregroundPainter: SifiDot()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size / 20, size / 21.5, 0, 0),
                      child: Container(
                        width:  size / 4.3,
                        child: Image.asset("assets/selfie.png"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(size / 80, 0, 0, size / 4),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size / 100)),
                          border: Border.all(color: color, width: 1,),
                        ),
                        height: size / 6.9,
                        width: size / 22,
                        child: GridView.count(
                          crossAxisCount: 1,
                          children: [
                            addSideBarItem("assets/github.svg", "https://github.com/lokecode"),
                            addSideBarItem("assets/document.svg", "https://docs.google.com/document/d/1-D01MCZ_JAlun_Aph_C6SfXGpqEzYsvHzmnzeSYx_hc/edit?usp=sharing"),
                            addSideBarItem("assets/linkedIn.svg", "https://www.linkedin.com/in/loke-zinck-178523220/"),
                          ],
                        )
                      ),
                    ),
                    Container(
                      height: size /2,
                      width: size /3.2,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(size / 50)),
                                border: Border.all(color: color, width: 1,),
                            ),
                            width: size / 3.5,
                            height: size / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: size / 30,
                                  child: RaisedButton(
                                    onPressed: () {launch("https://developers.google.com/profile/u/105735906169779802825?utm_source=developer.android.com");},
                                    color: Colors.transparent,
                                    padding: EdgeInsets.all(0),
                                    child: Text("https://android-course-badges.com",
                                      style: TextStyle(
                                        fontSize: size / 77,
                                        color: color,
                                        fontFamily: 'Modeseven',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: color, width: 1,),
                              color: Colors.black87
                            ),
                            height: size / 2.13,
                            width: size / 3.5,
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: [
                                badgeTemplete("assets/android-course-badges/badge(3).png", "Api calls"),
                                badgeTemplete("assets/android-course-badges/badge(1).png", "Coroutines"),
                                badgeTemplete("assets/android-course-badges/badge(6).png", "Dice Roller App"),
                                badgeTemplete("assets/android-course-badges/badge(4).png", "10+ Codelabs"),
                                badgeTemplete("assets/android-course-badges/badge(0).png", "user input"),
                                badgeTemplete("assets/android-course-badges/badge(7).png", "Basic Layout"),
                                badgeTemplete("assets/android-course-badges/badge(2).png", "Introduction Kotlin"),
                                badgeTemplete("assets/android-course-badges/badge(5).png", "First Pathway"),
                                badgeTemplete("assets/android-course-badges/badge(8).png", "First App"),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                )
              ],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, size / 100, 0, 0),
                    child: Text("About Me",
                      style: TextStyle(
                        fontSize: size / 15,
                        color: color,
                        fontFamily: 'Modeseven',
                      ),
                    ),
                  ),
                  Container(
                    height: size / 1.25,
                    child: textAnimation("Hi im an talented\napp developer\nfrom copenhagen\ndenmark,im\nextraordinarily\ngood at\n"
                        "solving very\ncomplex problems\nand i always\nfind a solid\nsolution to them,\n"
                        "im surprisingly,\nquick at learning,\ni can almost\ncode something\nwhile im learning\n"
                        "it. i always code\nwith coding\narchitecture like\nMVVM, and of\ncourse i use\ninheritance and\n"
                        "parent, sub, and\nabstract classes,\nmy coding is also\nvery imperativ",
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}

