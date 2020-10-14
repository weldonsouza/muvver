import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  Delivery({Key key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Text('Entregas',
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
