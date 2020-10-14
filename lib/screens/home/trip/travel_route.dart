import 'package:flutter/material.dart';
import 'package:muvver/components/custom_text_field.dart';
import 'package:muvver/utils/globals.dart';
import 'package:intl/intl.dart';

import 'midpoint.dart';
import 'product_size.dart';

class TravelRoute extends StatefulWidget {
  @override
  _TravelRouteState createState() => _TravelRouteState();
}

class _TravelRouteState extends State<TravelRoute> {
  TextEditingController _dataControllerStart = TextEditingController(text: '');
  TextEditingController _dataControllerEnd = TextEditingController(text: '');
  TextEditingController _dataControllerCitySource = TextEditingController(text: 'Campo Grande, MS');
  TextEditingController _dataControllerCityDestiny = TextEditingController(text: 'Dourados, MS');

  PageController _controller = PageController(initialPage: 0);
  var colorRoute, colorMaps;

  @override
  void initState() {
    super.initState();
    colorRoute = Colors.white;
    colorMaps = Colors.transparent;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: mediaQuery(context, 1),
              height: mediaQuery(context, 1.65),
              color: Colors.white,
              padding: EdgeInsets.only(top: 175, bottom: 80),
              child: PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Text('Selecione a data e rota da sua viagem',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'TitilliumWeb',
                                        color: Color(0xff222222),
                                        fontWeight: FontWeight.bold
                                    )),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextField(
                                width: mediaQuery(context, 0.44),
                                readOnly: true,
                                labelText: 'Data de partida',
                                controller: _dataControllerStart,
                                textInputAction: TextInputAction.next,
                                color: Colors.black,
                                colorBord: Colors.black,
                                colorText: _dataControllerStart.text == '' ? Color(0xffa9a9a9) : Colors.black,
                                onTap: () async{
                                  final DateTime picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(Duration(days: 365)),
                                    builder: (BuildContext context, Widget child) {
                                      return Theme(
                                        data: ThemeData(
                                            primaryColor: const Color(0xFF24B96E),
                                            accentColor: const Color(0xFF24B96E),
                                            colorScheme: ColorScheme.light(primary: const Color(0xFF24B96E)),
                                            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)
                                        ),
                                        child: child,
                                      );
                                    },
                                  );

                                  if (picked != null && picked.toString() != _dataControllerStart.text){
                                    setState(() {
                                      departureDate = _dataControllerStart.text = DateFormat("dd/MM/yyyy").format(picked).toString();
                                    });
                                  }
                                },
                              ),
                              CustomTextField(
                                width: mediaQuery(context, 0.44),
                                readOnly: true,
                                labelText: 'Data de chegada',
                                controller: _dataControllerEnd,
                                textInputAction: TextInputAction.next,
                                color: Colors.black,
                                colorBord: Colors.black,
                                colorText: _dataControllerEnd.text == '' ? Color(0xffa9a9a9) : Colors.black,
                                onTap: () async{
                                  final DateTime picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(Duration(days: 365)),
                                    builder: (BuildContext context, Widget child) {
                                      return Theme(
                                        data: ThemeData(
                                            primaryColor: const Color(0xFF24B96E),
                                            accentColor: const Color(0xFF24B96E),
                                            colorScheme: ColorScheme.light(primary: const Color(0xFF24B96E)),
                                            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)
                                        ),
                                        child: child,
                                      );
                                    },
                                  );

                                  if (picked != null && picked.toString() != _dataControllerEnd.text){
                                    setState(() {
                                      arrivalDate = _dataControllerEnd.text = DateFormat("dd/MM/yyyy").format(picked).toString();
                                    });
                                  }
                                },
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: CustomTextField(
                              width: mediaQuery(context, 1),
                              labelText: 'Cidade de origem',
                              controller: _dataControllerCitySource,
                              textInputAction: TextInputAction.next,
                              color: Colors.black,
                              colorBord: Colors.black,
                              colorText: _dataControllerCitySource.text == '' ? Color(0xffa9a9a9) : Colors.black,
                              prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
                            ),
                          ),

                          StreamBuilder(
                            stream: streamController.stream,
                            builder: (context, snapshot){
                              Widget widget;

                              if(snapshot.data != '' && snapshot.data != null){
                                widget = Padding(
                                  padding: EdgeInsets.only(left: 16, right: 8, bottom: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset('assets/icon/pointer-spot-tool-for-maps.png', scale: 2),
                                          SizedBox(width: 16),
                                          Text('${snapshot.data}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'TitilliumWeb',
                                                color: Color(0xFF222222),
                                              )),

                                        ],
                                      ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                                onTap: () {
                                                  streamController.add('');
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Icon(Icons.close, color: Colors.black38),
                                                )
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

                          Padding(
                            padding: EdgeInsets.only(bottom: 28),
                            child: CustomTextField(
                              width: mediaQuery(context, 1),
                              labelText: 'Cidade de destino',
                              controller: _dataControllerCityDestiny,
                              textInputAction: TextInputAction.next,
                              color: Colors.black,
                              colorBord: Colors.black,
                              colorText: _dataControllerCityDestiny.text == '' ? Color(0xffa9a9a9) : Colors.black,
                              prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Midpoint()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.add_circle_outline, size: 24),
                                SizedBox(width: 9),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Adicionar ponto intermediário',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'TitilliumWeb',
                                            color: Color(0xff353740),
                                            fontWeight: FontWeight.bold
                                        )),
                                    Text('E aumente sua chance de match',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'TitilliumWeb',
                                          color: Color(0xff22222252),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: mediaQuery(context, 0.155))
                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Mapa'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: mediaQuery(context, 1),
            height: 170,
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
                    StreamBuilder(
                      stream: streamController.stream,
                      builder: (context, snapshot){
                        Widget widget;

                        if(snapshot.data != '' && snapshot.data != null){
                          widget = Padding(
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
                          );
                        } else {
                          widget = Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Viajante',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'TitilliumWeb',
                                      color: Colors.white60,
                                    )),
                              ],
                            ),
                          );
                        }

                        return widget;
                      },
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
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: Text('Qual o trajeto da sua viagem?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'TitilliumWeb',
                        color: Color(0xFFFFFFFF),
                      )),
                ),
                Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            _controller.animateToPage(0,
                                duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                            setState(() {
                              colorRoute = Colors.white;
                              colorMaps = Colors.transparent;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: colorRoute,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: mediaQuery(context, 0.5),
                            height: 40,
                            child: Text('Rotas',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'TitilliumWeb',
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold
                                )),
                          )
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            _controller.animateToPage(1,
                                duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                            setState(() {
                              colorRoute = Colors.transparent;
                              colorMaps = Colors.white;
                            });
                          }, // handle your onTap here
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: colorMaps,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: mediaQuery(context, 0.5),
                            height: 40,
                            child: Text('Mapa',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'TitilliumWeb',
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold
                                )),
                          )
                      ),
                    ),
                  ],
                ),
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
                      _controller.animateToPage(1,
                          duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                      setState(() {
                        colorRoute = Colors.transparent;
                        colorMaps = Colors.white;
                      });

                      if(_controller.page == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductSize()));
                        _controller.animateToPage(0,
                            duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                        setState(() {
                          colorRoute = Colors.white;
                          colorMaps = Colors.transparent;
                        });
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
          ),
        ],
      ),
    );
  }
}
