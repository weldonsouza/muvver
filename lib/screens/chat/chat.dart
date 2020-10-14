import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Text('Chat',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'TitilliumWeb',
                    color: Color(0xff222222))),
          ),
        ),
      ),
    );
  }
}
