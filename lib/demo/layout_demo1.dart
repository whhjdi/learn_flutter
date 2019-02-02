import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = TitleSection('hello', '123', 123);
    final buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buttonSectionColumn(context, Icons.call, 'call'),
          _buttonSectionColumn(context, Icons.share, 'share'),
          _buttonSectionColumn(context, Icons.near_me, 'near_me')
        ],
      ),
    );
    final textSection = Container(
      child: Text(
          '''Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。
''',
          softWrap: true),
      padding: EdgeInsets.all(32.0),
      alignment: Alignment(0, 0),
    );

    return MaterialApp(
      title: 'muxue',
      home: Scaffold(
          appBar: AppBar(
            title: Text('hello'),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/img.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )),
    );
  }
}

Widget _buttonSectionColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            )),
      )
    ],
  );
}

class TitleSection extends StatelessWidget {
  final String title;
  final String subTitle;
  final int star;

  TitleSection(this.title, this.subTitle, this.star);

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
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(star.toString()),
        ],
      ),
    );
  }
}
