import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/navigation_bar_controller.dart';
import 'utils/globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('pt', 'BR') // Portuguese
      ],

      title: 'MUVVER',
      theme: ThemeData(
        primaryColor: colorBase,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavigationBarController(),
      debugShowCheckedModeBanner: false,
    );
  }
}
