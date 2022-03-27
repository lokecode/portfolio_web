import 'dart:async';

import 'package:flutter/material.dart';

class CodeLoading extends StatefulWidget {

  @override
  State<CodeLoading> createState() => _CodeLoadingState();
}

class _CodeLoadingState extends State<CodeLoading> {
  String codeLoading = '';
  String portfolioText = '';
  int time = 0;
  int time2 = 0;
  double height = 0;
  double width = 0;
  double size = 0;
  var color = Colors.green;
  var writeDotColor = Colors.black45;
  var runTimer = true;
  bool writeDotVisible = false;

  calculatorSize() {
    if(width >= height) {
      size = height;

    } else {
      size = width;

    }
  }

  timer() async {
    Timer(Duration(milliseconds: 20), () => setState(() {
      setState(() {
        time += 1;
        codeLoading = "void main() {\n\n runWeb(\n  load:\n );\n\n}".substring(0, time);
      });
    }));
  }

  timer2() {
    setState(() {
      Timer(Duration(milliseconds: 500), () => setState(() {
        time2 += 1;
        if(time2 >= 5) {
          portfolioText = "portfolio".substring(0, (time2 - 6));
        }
      }));
    });
  }

  dotBlinking() {
    Timer(Duration(milliseconds: 100), () => setState(() {
        if (writeDotColor == Colors.black45) {
          writeDotColor = color;
        } else {
          writeDotColor = Colors.black45;
        }
    }));
  }

  text(int textSize, String text) {
    return Text(text,
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
    dotBlinking();

    if (time >= 38){
      writeDotVisible = true;
      timer2();
    } else {
      timer();
    }

    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(size / 20),
            child: text(20, codeLoading),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(size / 3.9, size / 5.2, 0, 0),
            child: Row(
              children: [
                text(20, portfolioText),
                Padding(
                  padding: EdgeInsets.all(size / 100),
                  child: Visibility(
                    visible: writeDotVisible,
                    child: Container(
                      color: writeDotColor,
                      height: size/ 25,
                      width: size/ 60,
                    ),
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }
}
