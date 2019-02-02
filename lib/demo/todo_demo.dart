import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo',
      home: MessageListScreen(),
    );
  }
}

//表单页
class MessageFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('todo')),
      body: MessageForm(),
    );
  }
}

//表单
class MessageForm extends StatefulWidget {
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final editController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '请输入todo',
                  contentPadding: EdgeInsets.all(0.0),
                ),
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black54,
                ),
                controller: editController,
                autofocus: true,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              debugPrint('send: ${editController.text}');
              final msg = Message(
                  editController.text, DateTime.now().millisecondsSinceEpoch);
              Navigator.pop(context, msg);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text('添加'),
            ),
          ),
        ],
      ),
    );
  }
}

//列表数据
class MessageList extends StatefulWidget {
  MessageList(Key key) : super(key: key);

  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final subtitle = DateTime.fromMillisecondsSinceEpoch(msg.timestamp)
            .toLocal()
            .toIso8601String();
        return ListTile(
          title: Text(msg.msg),
          subtitle: Text(subtitle),
        );
      },
    );
  }

  void addMessage(Message msg) {
    setState(() {
      messages.add(msg);
    });
  }
}

//列表页面
class MessageListScreen extends StatelessWidget {
  final messageListKey =
      GlobalKey<_MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
      ),
      body: MessageList(messageListKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MessageFormScreen()),
          );
          if (result is Message) {
            messageListKey.currentState.addMessage(result);
          }
        },
        tooltip: '添加',
        child: Icon(Icons.add),
      ),
    );
  }
}

//model
class Message {
  final String msg;
  final int timestamp;
  Message(this.msg, this.timestamp);
  @override
  String toString() {
    return 'Message{msg:$msg,timestamp:$timestamp}';
  }
}
