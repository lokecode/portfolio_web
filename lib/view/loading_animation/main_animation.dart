import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_web/view/loading_animation/loading_bar.dart';
import 'package:portfolio_web/view/loading_animation/loading_code.dart';
import 'package:portfolio_web/view/loading_animation/portfolio_animation.dart';

class MainAnimation extends StatefulWidget {

  @override
  State<MainAnimation> createState() => _MainAnimationState();
}

class _MainAnimationState extends State<MainAnimation> {
  dynamic animationRunning = CodeLoading();
  var color = Colors.black;
  bool runTimer = true;
  bool runPortfolioAnimation = false;
  bool animationVisible = true;

  animation() {
    Timer(Duration(milliseconds: 2500), () => setState(() {
      setState(() {
        animationRunning = LoadingBar();
        timer();
      });
    }));
    return animationRunning;
  }
  timer() {
    Timer(Duration(milliseconds: 1500), () => setState(() {
      setState(() {
        runTimer = false;
        runPortfolioAnimation = true;
        color = Colors.transparent;
        timer2();
      });
    }));
  }

  timer2() {
    Timer(Duration(milliseconds: 2200), () => setState(() {
      setState(() {
        animationVisible = false;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: animationVisible,
      child: Scaffold(
        backgroundColor: color,
        body: Stack(
          children: [
            Visibility(
              visible: runTimer,
                child: animation()
            ),
            Visibility(
                visible: runPortfolioAnimation,
                child: portfolioAnimation()
            ),
          ],
        ),
      ),
    );
  }
}
