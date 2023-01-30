import 'package:demo_project/screens/profile%20screen/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contatnts.dart';
import '../Home/home.dart';
import '../cart screen/CartScreen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Map<String, dynamic>> _pages = [
    {'page': Home(), 'title': 'Home'},
    {'page': CartScreen(), 'title': 'Cart'},
    {'page': Profile(), 'title': 'Profile'},
  ];
  int _selectedPageIndex = 0;
  Index(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: Index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constants.primaryColor,
        selectedItemColor: Constants.forthcolor,
        unselectedItemColor: Constants.secondryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
