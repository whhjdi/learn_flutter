import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'muxue',
      theme: ThemeData.dark(),
      home: ExpansionTileWidget(),
    );
  }
}

class ExpansionTileWidget extends StatefulWidget {
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              leading: Icon(Icons.leak_add),
              title: Text('点击展开'),
              backgroundColor: Colors.white12,
              children: <Widget>[
                ListTile(
                  title: Text('view1'),
                  subtitle: Text('哈哈哈'),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.leak_add),
              title: Text('点击展开'),
              backgroundColor: Colors.white12,
              children: <Widget>[
                ListTile(
                  title: Text('view1'),
                  subtitle: Text('哈哈哈'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
