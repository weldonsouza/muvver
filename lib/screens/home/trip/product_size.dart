import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:muvver/utils/globals.dart';

import 'total_weight.dart';

class ProductSize extends StatefulWidget {
  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  String _picked = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 185, bottom: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('Tamanhos',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'TitilliumWeb',
                            color: Color(0xFF222222),
                            fontWeight: FontWeight.bold
                        )),
                  ),
                  RadioButtonGroup(
                    orientation: GroupedButtonsOrientation.VERTICAL,
                    onSelected: (String selected) => setState((){
                      _picked = selected;
                      streamControllerButtonProduct.add(_picked);
                    }),
                    labels: <String>['Envelope', 'Livro', 'Caixa de sapato', 'Mochila', 'Mala grande', 'Caixa grande'],
                    picked: _picked,
                    labelStyle: TextStyle(color: Color(0xFF222222), fontSize: 12, fontFamily: 'TitilliumWeb', fontWeight: FontWeight.bold),
                    activeColor: Color(0xff24B96E),
                    itemBuilder: (Radio rb, Text txt, int i){
                      return Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              child: Material(
                                color: Colors.white.withOpacity(0.3),
                                child: InkWell(
                                  onTap: () {
                                    setState((){
                                      _picked = txt.data;
                                      streamControllerButtonProduct.add(_picked);
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          _iconProductSize(txt.data),
                                          SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              txt,
                                              Text('00 x 00 cm',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'TitilliumWeb',
                                                    color: Color(0xFF22222252),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      rb,
                                    ],
                                  ),
                                ),
                              )
                          ),
                          txt.data == 'Caixa grande' ? Container() :
                          Divider(color: Color(0x2222221F), height: 20),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: mediaQuery(context, 1),
            height: 160,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff353740),
                  Color(0xff222222)
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ser um Muvver',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'TitilliumWeb',
                                color: Colors.white60,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.arrow_back, color: Colors.white)),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancelar',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'TitilliumWeb',
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text('O volume que você pode deslocar tem tamanho similar a que?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'TitilliumWeb',
                        color: Color(0xFFFFFFFF),
                      )),
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: streamControllerButtonProduct.stream,
            builder: (context, snapshot){
              Widget widget;

              if(snapshot.data != '' && snapshot.data != null){
                widget = Positioned(
                  bottom: 8,
                  right: 16,
                  left: 16,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Material(
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Color(0xff222222),
                            child: InkWell(
                              onTap: () {
                                if(_picked != '') {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                      TotalWeight()));
                                }
                              },
                              child: Container(
                                width: mediaQuery(context, 1),
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: Color(0xff22222229))
                                ),
                                child: Text('Pular etapa', style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'TitilliumWeb',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 10),
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Material(
                            color: Color(0xFF16A45C),
                            elevation: 5,
                            shadowColor: Color(0xff222222),
                            child: InkWell(
                              onTap: () {
                                if(_picked != '') {
                                  similarSize = _picked;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TotalWeight()));
                                }
                              },
                              child: Container(
                                width: mediaQuery(context, 1),
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  //border: Border.all(color: Colors.white70)
                                ),
                                child: Text('Avançar', style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'TitilliumWeb',
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                );
              } else {
                widget = Container();
              }

              return widget;
            },
          ),
        ],
      ),
    );
  }

  _iconProductSize(iconData){
    Widget icon;

    if(iconData == 'Envelope'){
      icon = Image.asset('assets/icon/ic_email.png', scale: 2);
    } else if(iconData == 'Livro'){
      icon = Image.asset('assets/icon/ic_book.png', scale: 2);
    } else if(iconData == 'Caixa de sapato'){
      icon = Image.asset('assets/icon/ic_box.png', scale: 2);
    } else if(iconData == 'Mochila'){
      icon = Image.asset('assets/icon/ic_backpack.png', scale: 2);
    } else if(iconData == 'Mala grande'){
      icon = Image.asset('assets/icon/ic_mala.png', scale: 2);
    } else if(iconData == 'Caixa grande'){
      icon = Image.asset('assets/icon/ic_big_box.png', scale: 2);
    }

    return icon;
  }
}
