import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:muvver/screens/chat/chat.dart';
import 'package:muvver/screens/delivery/delivery.dart';
import 'package:muvver/screens/home/home_screen.dart';
import 'package:muvver/screens/notification/notificationscreen.dart';
import 'package:muvver/screens/purchase/purchase.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    HomeScreen(
      key: PageStorageKey('HomePage'),
    ),
    NotificationScreen(
      key: PageStorageKey('NotificationScreen'),
    ),
    Chat(
      key: PageStorageKey('Chat'),
    ),
    Purchase(
      key: PageStorageKey('Purchase'),
    ),
    Delivery(
      key: PageStorageKey('Delivery'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;
  static const _black = Colors.black;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    elevation: 0,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blueGrey[600],
    unselectedItemColor: Colors.blueGrey[200],
    type: BottomNavigationBarType.fixed,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Início'),
          backgroundColor: _black),
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text('Notificações'),
          backgroundColor: _black),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          title: Text('Chat'),
          backgroundColor: _black),
      BottomNavigationBarItem(
          icon: Icon(Icons.layers),
          title: Text('Pedidos'),
          backgroundColor: _black),
      BottomNavigationBarItem(
          icon: Icon(MdiIcons.truck),
          title: Text('Entregas'),
          backgroundColor: _black),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}