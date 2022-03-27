import 'dart:async';

import 'package:flutter/material.dart';

class portfolioAnimation extends StatefulWidget {
  const portfolioAnimation({Key? key}) : super(key: key);

  @override
  State<portfolioAnimation> createState() => _portfolioAnimationState();
}

class _portfolioAnimationState extends State<portfolioAnimation> {
  double height = 0;
  double width = 0;
  double animatedContainerHeight = 0;
  double qq = 0;
  bool runTimer = true;


  timer() async {
    animatedContainerHeight = height;
    Timer(Duration(milliseconds: 20), () => setState(() {
      setState(() {
        animatedContainerHeight = 0;
        qq = height / 8;
        runTimer = false;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if(runTimer) {
      timer();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: qq,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent,Colors.black,]
            )
          ),
        ),
        AnimatedContainer(
          height: animatedContainerHeight,
          color: Colors.black,
          duration: Duration(seconds: 2),
        )
      ],
    );
  }
}
