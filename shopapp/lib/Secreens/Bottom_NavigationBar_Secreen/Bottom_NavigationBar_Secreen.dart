import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopapp/List_Views/List_View_Cart.dart';

import 'package:shopapp/Secreens/Bottom_NavigationBar_Secreen/Profile_Secreen.dart';
import 'package:shopapp/Secreens/Favourates_Secreen.dart';
import 'package:shopapp/Secreens/cart_secreen.dart';

import '../../List_Views/List_Favourates.dart';
import '../Main_End_User.dart';
import 'Track_Secreen.dart';


class ButtomNavigationScreen extends StatefulWidget {
  ButtomNavigationScreen({super.key});

  @override
  State<ButtomNavigationScreen> createState() => _ButtomNavigationScreenState();
}

class _ButtomNavigationScreenState extends State<ButtomNavigationScreen> {
  int _selectedIndex = 0;

  // List<Widget> bodyScreens = <Widget>[
  //   HomeScreen(),
  //   FavoritesScreen(),
  //   TrackScreen(),
  //   ProfileScreen(),
  // ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('$_selectedIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // bodyScreens.elementAt(_selectedIndex),
      Builder(builder: (BuildContext context) {
        return _selectedIndex == 0
            ? const Main_Enduser_Serceen()
            : _selectedIndex == 1
            ? const FavoritesScreen()
            : _selectedIndex == 2
            ? const Tracj_Secreen()
            : const Profile_Secreen();
      },),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xff23AA49),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(Icons.favorite)
                ],
              ),
              label: 'Favourate',
          ),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.track_changes)
                ],
              ),
              label: 'Offers'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff23AA49),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartScreen();
              },
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}