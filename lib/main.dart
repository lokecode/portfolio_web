import 'package:flutter/material.dart';
import 'package:portfolio_web/view/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView()
    );
  }
}
