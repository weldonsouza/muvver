import 'package:flutter/material.dart';
import 'package:muvver/components/custom_text_field.dart';
import 'package:muvver/utils/globals.dart';

class Midpoint extends StatefulWidget {
  @override
  _MidpointState createState() => _MidpointState();
}

class _MidpointState extends State<Midpoint> {

  TextEditingController _dataControllerMidPoint = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 96),
            child: Container(
              height: mediaQuery(context, 2),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text('Ponto intermediário',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'TitilliumWeb',
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.bold
                          )),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'TitilliumWeb',
                            letterSpacing: 0.75,
                            color: Color(0xff22222252)),
                        children: <TextSpan>[
                          TextSpan(text: 'Insira os pontos intermediários na '),
                          TextSpan(text: 'sequência exata', style: TextStyle( color: Color(0xff222222),
                              fontWeight: FontWeight.bold)),
                          TextSpan(text: ' em que você passará por eles'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 15),
                      child: CustomTextField(
                        width: mediaQuery(context, 1),
                        labelText: 'Nome da cidade',
                        controller: _dataControllerMidPoint,
                        textInputAction: TextInputAction.next,
                        focusNode: FocusNode(),
                        color: Colors.black,
                        colorBord: Colors.black,
                        colorText: _dataControllerMidPoint.text == '' ? Color(0xffa9a9a9) : Colors.black,
                        prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 70, bottom: 16),
                      child: Text('Usuários que viajam de campo Grande - MS para Dourados - MS também passam por:',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'TitilliumWeb',
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.bold
                          )),
                    ),
                    Column(
                      children: [
                        _listCity('Rio Brilhante - MS'),
                        _listCity('Maracaju - MS'),
                        _listCity('Itaporã - MS'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: mediaQuery(context, 1),
            height: 80,
            padding: EdgeInsets.only(left: 16, top: 16),
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
                  child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close, color: Colors.white)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
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
                      if(_dataControllerMidPoint.text == ''){
                        streamController.add('Nova Alvorada');
                      } else {
                        streamController.add(_dataControllerMidPoint.text);
                      }

                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: mediaQuery(context, 1),
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        //border: Border.all(color: Colors.white70)
                      ),
                      child: Text('Confirmar', style: TextStyle(
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

  _listCity(city){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset('assets/icon/pointer-spot-tool-for-maps.png', scale: 2),
          SizedBox(width: 16),
          Text(city,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'TitilliumWeb',
                  color: Color(0xFF222222),
              )),
        ],
      ),
    );
  }
}
