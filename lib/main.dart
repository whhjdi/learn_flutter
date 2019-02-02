import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buttonSectionColumn(CupertinoIcons.eye, '电话'),
        _buttonSectionColumn(CupertinoIcons.eye, '电话'),
        _buttonSectionColumn(CupertinoIcons.eye, '电话'),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'muxue',
      home: CupertinoPageScaffold(
        child: Container(
          child: Column(
            children: <Widget>[
              TitleSection(),
              buttonSection,
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('标题'),
                ),
                Text('副标题'),
              ],
            ),
          ),
          Icon(
            CupertinoIcons.eye,
            color: CupertinoColors.destructiveRed,
          ),
          Text('123'),
        ],
      ),
    );
  }
}

Widget _buttonSectionColumn(IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: CupertinoColors.activeBlue),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.activeBlue,
            )),
      )
    ],
  );
}
