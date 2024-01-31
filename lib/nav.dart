import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:navigationbar/pages/data_page.dart';
import 'package:navigationbar/pages/home_page.dart';
import 'package:navigationbar/pages/like_page.dart';
import 'package:navigationbar/pages/search_page.dart';
import 'package:navigationbar/pages/setting_page.dart';
// import 'package:get/get.dart';
// import 'package:navigationbar/pages/home_page.dart';
// import 'package:navigationbar/pages/like_page.dart';
// import 'package:navigationbar/pages/search_page.dart';
// import 'package:navigationbar/pages/setting_page.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _page = const [
      HomePage(), 
      DataPage(),
      LikePage(),
      SearchPage(),
      SettingPage()
    ];

  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: onTabChange,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              padding: const EdgeInsets.all(16),
              // onTabChange: (index) {
              //   setState(() {
              //     _pageindex = index;
              //   });
              // },
              // onTabChange: (index) {
              //   print(index);
              // },
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(
                  icon: Icons.bookmark_border_sharp,
                  text: 'Information',
                ),
                GButton(icon: Icons.favorite_border, text: 'Likes'),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ]),
        ),
      ),
    );
  }
}
