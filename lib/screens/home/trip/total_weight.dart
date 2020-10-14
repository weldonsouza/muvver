import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:muvver/utils/globals.dart';
import 'delivery_price.dart';

class TotalWeight extends StatefulWidget {
  @override
  _TotalWeightState createState() => _TotalWeightState();
}

class _TotalWeightState extends State<TotalWeight> {
  String _picked = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 150, bottom: 170),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('Peso',
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
                      streamControllerButtonTotal.add(_picked);
                    }),
                    labels: <String>['Até 1 kg', 'Até 5 kg', 'Até 10 kg', 'Até 20 kg', 'Outro'],
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
                                      streamControllerButtonTotal.add(_picked);
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          _iconTotalWeight(txt.data),
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
                          txt.data == 'Outro' ? Container() :
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
            height: 130,
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
                  child: Text('Qual o peso do volume?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'TitilliumWeb',
                        color: Color(0xFFFFFFFF),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          if(_picked != '') {
                            weight = _picked;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryPrice()));
                          }
                        },
                        child: Container(
                          width: mediaQuery(context, 1),
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
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
                StreamBuilder(
                  stream: streamControllerButtonTotal.stream,
                  builder: (context, snapshot){
                    Widget widget;

                    if(snapshot.data != '' && snapshot.data != null){
                      widget = ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Material(
                            color: Color(0xFF16A45C),
                            elevation: 5,
                            shadowColor: Color(0xff222222),
                            child: InkWell(
                              onTap: () {
                                if(_picked != '') {
                                  weight = _picked;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryPrice()));
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
                      );
                    } else {
                      widget = ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Material(
                            color: Color(0xFF22222229),
                            shadowColor: Color(0xff222222),
                            child: InkWell(
                              onTap: () {
                                if(_picked != '') {
                                  weight = _picked;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryPrice()));
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
                      );
                    }

                    return widget;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _iconTotalWeight(iconData){
    Widget icon;

    if(iconData == 'Até 1 kg'){
      icon = Image.asset('assets/icon/ic_balance_1.png', scale: 2);
    }  else if(iconData == 'Até 5 kg'){
      icon = Image.asset('assets/icon/ic_balance_2.png', scale: 2);
    } else if(iconData == 'Até 10 kg'){
      icon = Image.asset('assets/icon/ic_balance_3.png', scale: 2);
    } else if(iconData == 'Até 20 kg'){
      icon = Image.asset('assets/icon/ic_balance_4.png', scale: 2);
    } else if(iconData == 'Outro'){
      icon = Image.asset('assets/icon/ic_balance_5.png', scale: 2);
    }

    return icon;
  }
}
