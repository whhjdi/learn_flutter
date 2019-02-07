import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'muxue',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          '第一个页面',
          style: TextStyle(fontSize: 36.0),
        ),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              CustomRouter(
                SecondPage(),
              ),
            );
          },
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          '第二个页面',
          style: TextStyle(fontSize: 36.0),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 64.0,
          ),
        ),
      ),
    );
  }
}

class CustomRouter extends PageRouteBuilder {
  final Widget widget;
  CustomRouter(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
            Widget child,
          ) {
            //滑入动画
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1.0, 0.0),
                end: Offset(0.0, 0.0),
              ).animate(
                CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            );

            //旋转加缩放
            // return RotationTransition(
            //   turns: Tween(begin: 0.0, end: 1.0).animate(
            //     CurvedAnimation(
            //       parent: animation1,
            //       curve: Curves.fastOutSlowIn,
            //     ),
            //   ),
            //   child: ScaleTransition(
            //     scale: Tween(begin: 0.0, end: 1.0).animate(
            //       CurvedAnimation(
            //         parent: animation1,
            //         curve: Curves.fastOutSlowIn,
            //       ),
            //     ),
            //     child: child,
            //   ),
            // );

            //缩放动画
            // return ScaleTransition(
            //     scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            //       parent: animation1,
            //       curve: Curves.fastOutSlowIn,
            //     )),
            //     child: child);
            //渐隐动画
            // return FadeTransition(
            //   opacity: Tween(begin: 0.0, end: 1.0).animate(
            //     CurvedAnimation(
            //       parent: animation1,
            //       curve: Curves.fastOutSlowIn,
            //     ),
            //   ),
            //   child: child,
            // );
          },
        );
}
