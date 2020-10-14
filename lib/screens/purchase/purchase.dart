import 'package:flutter/material.dart';

class Purchase extends StatefulWidget {
  Purchase({Key key}) : super(key: key);

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Text('Pedidos',
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
