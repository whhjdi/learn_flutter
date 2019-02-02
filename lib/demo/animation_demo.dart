import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animatino',
      home: AnimationWidget(),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  var controller;
  CurvedAnimation curve;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
    controller.forward();
  }

  @override
  // Widget build(BuildContext context) {
  //   var scaled = ScaleTransition(
  //     child: FlutterLogo(size: 200.0),
  //     scale: curve,
  //   );
  //   return ScaleTransition(
  //     child: FlutterLogo(size: 200.0),
  //     scale: controller,
  //   );
  // }
  Widget build(BuildContext context) {
    var scaled = ScaleTransition(
      child: FlutterLogo(size: 200.0),
      scale: curve,
    );
    return FadeTransition(
      child: scaled,
      opacity: curve,
    );
  }
}
