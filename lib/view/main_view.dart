import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_web/view/loading_animation/main_animation.dart';

import 'information_card.dart';
import 'three_dimensional_object.dart';

class MainView extends StatefulWidget {

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  double height = 0;
  double width = 0;
  double size = 0;
  bool runWidgets = false;

  calculatorCardSize() {
    if(width >= height) {
      size = height;
    } else {
      size = width;
    }
  }

  timer() {
    Timer(Duration(seconds: 5), () => setState(() {
      setState(() {
        runWidgets = true;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    calculatorCardSize();
    timer();
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Visibility(
                visible: runWidgets,
                child: ThreeDimensionalObject(width: width, height: height, size: size,),
              ),
              InformationCard(width: width, height: height, cardSize: size,),
              MainAnimation()
            ],
          )
      ),
    );
  }

}

