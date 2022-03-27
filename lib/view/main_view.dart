import 'package:flutter/material.dart';
import 'package:portfolio_web/view/loading_animation/main_animation.dart';

import 'information_card.dart';
import 'three_dimensional_object.dart';

class MainView extends StatefulWidget {

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              InformationCard(),
              ThreeDimensionalObject(),
            ],
          )
      ),
    );
  }

}

