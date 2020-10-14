import 'package:flutter/material.dart';
import 'package:muvver/utils/globals.dart';

class TripCreated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/icon/illustração_send.png', scale: mediaQuery(context, 0.005)),
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text('Viagem criada', style: TextStyle(
                fontSize: 32,
                fontFamily: 'TitilliumWeb',
                color: Color(0xFF222222))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 17),
            child: Text('Vamos ver os volumes já disponíveis para a sua\nviagem.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'TitilliumWeb',
                    color: Color(0xFF222222))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 29, bottom: 56),
            child: Text('Ao prosseguir, você declara para efeitos legais,\nadministrativos, '
                'jurídicos e demais aplicáveis, a veracidade de\ntodas as informações prestadas '
                'antes, durante e após\nqualquer uma das etapas do app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'TitilliumWeb',
                    color: Color(0xFF222222))),
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
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: mediaQuery(context, 1),
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text('Visualizar volumes', style: TextStyle(
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
