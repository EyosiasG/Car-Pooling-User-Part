import 'package:car_pool_app/Views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

import '../mytrips.dart';
import '../settings/settings_page.dart';

class NavBar extends StatefulWidget {
  static const String idScreen = "navBar";
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const Center(child: HomeScreen()),
      // Center(child: SearchDashboard()),
      const Center(child: MyTrips()),
      // Center(child: FavoriteItems()),
      const Center(child: SettingsPage()),
    ];
    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            size: 32,
          ),
          label: "Home"),
      // BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
      const BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.car_alt,
          ),
          label: "My trips"),
      const BottomNavigationBarItem(
          icon: Icon(Linecons.cog), label: "Settings"),
    ];
    assert(pages.length == items.length);

    final bottomNavBar = BottomNavigationBar(
        items: items,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      body: pages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
