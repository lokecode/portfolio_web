import 'package:flutter/material.dart';

class MakeContentScrollable extends StatefulWidget {

  final content;
  MakeContentScrollable({this.content});

  @override
  _MakeContentScrollableState createState() => _MakeContentScrollableState(content);
}

class _MakeContentScrollableState extends State<MakeContentScrollable> {
  final content;
  _MakeContentScrollableState(this.content);

  double dragPosistion = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Container(
          color: Colors.transparent,
          child: content,
        ),
      ),
    );
  }
}