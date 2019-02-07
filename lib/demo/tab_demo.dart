import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'muxue',
      home: BottomnavWidget(),
    );
  }
}

class BottomnavWidget extends StatefulWidget {
  _BottomnavWidgetState createState() => _BottomnavWidgetState();
}

class _BottomnavWidgetState extends State<BottomnavWidget> {
  final _bottomColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list..add(PageScreen1())..add(PageScreen2());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Container(
        child: list[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _bottomColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _bottomColor),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class PageScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('home1'),
    );
  }
}

class PageScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('home2'),
    );
  }
}
