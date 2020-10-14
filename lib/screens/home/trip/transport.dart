import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:muvver/utils/globals.dart';

import 'travel_route.dart';

class Transport extends StatefulWidget {
  @override
  _TransportState createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  String _picked = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 175, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text('Transporte',
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
                    }),
                    labels: <String>['Carro', 'Avião', 'Caminhão', 'Van', 'Moto', 'Bicicleta', 'Trem', 'Ônibus', 'Embarcação'],
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
                                      });
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            _iconTransport(txt.data),
                                            SizedBox(width: 16),
                                            txt,
                                          ],
                                        ),
                                        rb,
                                      ],
                                    ),
                                ),
                              )
                          ),
                          txt.data == 'Embarcação' ? Container() : Divider(color: Color(0x2222221F), height: 16),
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
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close, color: Colors.white)),
                      Text('Viajante',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'TitilliumWeb',
                            color: Colors.white60,
                          )),
                      Icon(Icons.close, color: Colors.transparent)
                    ],
                  ),
                ),
                Text('Qual será o meio de transporte da sua viagem?',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'TitilliumWeb',
                        color: Color(0xFFFFFFFF),
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 16,
            left: 16,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Material(
                  color: Color(0xFF16A45C),
                  elevation: 5,
                  shadowColor: Color(0xff222222),
                  child: InkWell(
                    onTap: () {
                      if(_picked != '') {
                        transport = _picked;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TravelRoute()));
                      }
                    },
                    child: Container(
                      width: mediaQuery(context, 1),
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
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
          ),
        ],
      ),
    );
  }

  _iconTransport(iconData){
    Widget icon;

    if(iconData == 'Carro'){
      icon = Image.asset('assets/icon/ic_car.png', scale: 2);
    } else if(iconData == 'Avião'){
      icon = Image.asset('assets/icon/ic_aviao.png', scale: 2);
    } else if(iconData == 'Caminhão'){
      icon = Image.asset('assets/icon/ic_caminhao.png', scale: 2);
    } else if(iconData == 'Van'){
      icon = Image.asset('assets/icon/ic_van.png', scale: 2);
    } else if(iconData == 'Moto'){
      icon = Image.asset('assets/icon/ic_moto.png', scale: 2);
    } else if(iconData == 'Bicicleta'){
      icon = Image.asset('assets/icon/ic_bike.png', scale: 2);
    } else if(iconData == 'Trem'){
      icon = Image.asset('assets/icon/ic_trem.png', scale: 2);
    } else if(iconData == 'Ônibus'){
      icon = Image.asset('assets/icon/ic_bus.png', scale: 2);
    } else if(iconData == 'Embarcação'){
      icon = Image.asset('assets/icon/ic_barco.png', scale: 2);
    }

    return icon;
  }
}
