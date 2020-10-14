import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muvver/repositories/traveler_repository.dart';
import 'package:muvver/utils/globals.dart';

import 'trip/transport.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 15, top: 28),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/icon/logo.png', scale: 1.7),
                    Card(
                      elevation: 3,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage("https://post-phinf.pstatic.net/MjAxOTAxMTJfODEg/MDAxNTQ3MjYwODI2NzMx.5oHnozUoLlmDbckUFAGRQDYhN8RjZeO03fY4Nhx8Jv0g.s_YU6s0R5mKgw3oGf8xX3B7vNJEsq8oxvBknsLQwfjYg.JPEG/azamat-zhanisov-1281197-unsplash.jpg?type=w1200"),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 49, bottom: 8),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'TitilliumWeb',
                          color: Color(0xff222222)),
                      children: <TextSpan>[
                        TextSpan(text: 'Facilitando seus'),
                        TextSpan(text: ' envios.', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Text('Entregue ou envie.',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'TitilliumWeb',
                        color: Color(0x22222252))),
                _cardSelect('Remetente', 'Pra onde quer enviar seu objeto?', 'ic-box.png', null),
                _cardSelect('Viajante', 'Vai viajar pra onde?', 'delivery-truck.png', Transport()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cardSelect(title, subTitle, icon, route){
    return GestureDetector(
      onTap: (){
        if(route != null){
          Navigator.push(context, MaterialPageRoute(builder: (context) => route));
        }
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.only(left: 0, right: 0, top: mediaQuery(context, 0.08)),
        child: Container(
          height: 135,
          padding: EdgeInsets.only(top: 24, left: mediaQuery(context, 0.09), right: mediaQuery(context, 0.09)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xff353740),
                Color(0xff222222)
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: mediaQuery(context, 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 43),
                      child: Text(title,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'TitilliumWeb',
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600
                          )),
                    ),
                    SizedBox(height: 8),
                    Text(subTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'TitilliumWeb',
                          color: Color(0xFFFFFFFF),
                        )),
                  ],
                ),
              ),
              Container(
                  width: 80,
                  height: 50,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset('assets/icon/$icon', scale: mediaQuery(context, 0.0045))),
            ],
          ),
        ),
      ),
    );
  }
}
