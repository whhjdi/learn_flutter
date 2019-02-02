import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/about': (context) => SecondScreen(),
      },
      title: 'muxue',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('点我跳转'),
          onPressed: () async {
            var msg = await Navigator.pushNamed(
              context,
              '/about',
            );
            debugPrint('msg:$msg');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('返回首页'),
          onPressed: () {
            Navigator.pop(context, '这是第二个页面返回的数据');
          },
        ),
      ),
    );
  }
}
