import 'dart:ui';
import 'package:flutter/material.dart';

import 'Screens/HomePage.dart';
import 'Screens/cartPage.dart';
import 'Screens/categoryPage.dart';
import 'Screens/dealsPage.dart';
import 'Screens/profileScreen.dart';



const Color primaryColor = Colors.black;

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add your logic here to respond to item press.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRect(
          // ClipRect to prevent blur overflow
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust the sigma values as needed
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
              child: getPage(_selectedIndex),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:  Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Deals',
            icon: Icon(Icons.monetization_on_outlined),
          ),
          BottomNavigationBarItem(
            label: 'cart',
            icon: Icon(Icons.shopping_cart_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return Homepage();
      case 1:
        return Categorypage();
      case 2:
        return DealsPage();
      case 3:
        return CartPage();
      default:
        return Profilescreen();
    }
  }
}