import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:muvver/components/animation_route.dart';
import 'package:muvver/repositories/traveler_repository.dart';
import 'package:muvver/utils/globals.dart';

import 'trip_created.dart';

class DeliveryPrice extends StatefulWidget {
  @override
  _DeliveryPriceState createState() => _DeliveryPriceState();
}

class _DeliveryPriceState extends State<DeliveryPrice> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
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
                      padding: EdgeInsets.only(left: 16, right: 100),
                      child: Text('Definir preço mínimo do deslocamento?',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'TitilliumWeb',
                            color: Color(0xFFFFFFFF),
                          )),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 24),
                    child: Row(
                      children: [
                        Text('Preço de entrega',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'TitilliumWeb',
                                color: Color(0xFF222222),
                                fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 4),
                    child: Text('Valor sugerido',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'TitilliumWeb',
                            color: Color(0xFF22222252),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.black,
                        inactiveTrackColor: Color(0xff2222221F),
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 3.5,
                        thumbColor: Colors.black,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayColor: Colors.black,
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 8.0),
                      ),
                      child: Slider(
                        value: _value,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            price = formatInt.format(_value);
                          });
                        },
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {}, // handle your onTap here
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          width: 65,
                          height: 30,
                          child: Text('R\$ ${formatFraction.format(_value)}',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'TitilliumWeb',
                                color: Color(0xFF222222),
                              )),
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Clique no valor acima, para um preço mais específico.',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'TitilliumWeb',
                          color: Color(0xFF22222252),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Material(
                  color: Color(0xFF16A45C),
                  elevation: 5,
                  shadowColor: Color(0xff222222),
                  child: InkWell(
                    onTap: () async {

                      Navigator.of(context).push(AnimationRoute());
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
          )
        ],
      ),
    );
  }
}
