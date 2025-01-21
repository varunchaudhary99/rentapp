
import 'package:flutter/material.dart';
import 'package:rentapp/screens/car_detail_page.dart';
import 'package:rentapp/screens/home_page.dart';
import 'package:rentapp/screens/payment_page.dart';

import '../widgets/widgets/colors.dart';



class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {

  int _currentIndex =0;
  static  List<Widget> _widgetOptions = <Widget>[
    /// matches received sent accepted
    HomePage(),
    CarDetailsPage(),
    PaymentPage(),
    //Chat()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 10),
        backgroundColor: ColorSelect.greenColor,
        unselectedLabelStyle: TextStyle(fontSize: 10),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],

      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
    );
  }
}
