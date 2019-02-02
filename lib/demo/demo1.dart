import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '沐雪',
      home: Scaffold(
        appBar: AppBar(
          title: Text('我的应用'),
        ),
        body: Center(
          child: StackTestWidget(),
        ),
      ),
    );
  }
}

class StackTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(-1, 0),
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
        ),
        Text('foobar'),
        Text('12')
      ],
    );
  }
}

//column/row
class SecondTextWidget extends StatefulWidget {
  _SecondTextWidgetState createState() => _SecondTextWidgetState();
}

class _SecondTextWidgetState extends State<SecondTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('text1'),
          Text('text2'),
          Text('text3'),
          Text('text4'),
          Text('text5')
        ],
      ),
    );
  }
}

//简单布局
class TextWidget extends StatefulWidget {
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('text'),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      width: 80.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

//button
class MyButton extends StatefulWidget {
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Icon(Icons.favorite_border),
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('这是一个提示'),
        );
      },
    );
  }
}

class MessageForm extends StatefulWidget {
  _MessageFormState createState() => _MessageFormState();
}

//文本输入框
class _MessageFormState extends State<MessageForm> {
  var editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: TextField(
            controller: editingController,
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            child: Text('button'),
            onPressed: () {},
          ),
        ),
        RaisedButton(
            child: Text('hello'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('提示'),
                    content: Text(editingController.text),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('ok'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            })
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    editingController.dispose();
  }
}
