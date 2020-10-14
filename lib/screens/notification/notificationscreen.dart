import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Text('Notificações',
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
