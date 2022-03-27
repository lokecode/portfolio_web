import 'dart:async';

import 'package:flutter/material.dart';

class LoadingBar extends StatefulWidget {

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  String barLoading = '';
  double time = 0;
  double height = 0;
  double width = 0;
  double size = 0;
  var color = Colors.green;
  var runTimer = true;

  calculatorSize() {
    if(width >= height) {
      size = height;

    } else {
      size = width;

    }
  }

  timer() {
    Timer(Duration(milliseconds: 30), () => setState(() {
      setState(() {
        time += 4.55;
        barLoading = "######################".substring(0, (time / 4.5).toInt());
      });
    }));
    if (time >= 92) {
      runTimer = false;
    }
  }

  text(int textSize, String text) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size / textSize,
        color: color,
        fontFamily: 'Modeseven',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width ;
    calculatorSize();
    if(runTimer) {
      timer();
    }

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(size / 100),
              child: text(30, "LOADING"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(20, "${time.toInt()}%"),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  width: size / 1.5,
                  child: Row(
                    children: [
                      text(20, barLoading),
                    ],
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
