import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'muxue',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: CustomBottomAppBar(),
    );
  }
}

class CustomBottomAppBar extends StatefulWidget {
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<Widget> _eachView;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _eachView = List();
    _eachView..add(EachView('home'))..add(EachView('rank'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return EachView('newPage');
            }),
          );
        },
        tooltip: 'hello',
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _eachView[_index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.brown,
                )),
            IconButton(
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
              icon: Icon(
                Icons.home,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);

  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}
