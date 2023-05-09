import 'package:fitness/features/blogger/presentation/screens/home_page.dart';
import 'package:fitness/features/blogger/presentation/screens/news_page.dart';
import 'package:fitness/features/blogger/presentation/screens/timetable_page.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    TimeTableScreen(),
    NewsPageScreen(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          selectedItemColor: ColorHelper.blue01DDEB,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xff878383),
          onTap: onSelectTab,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: "DESK"),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "NEWS"),
          ]),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
    );
  }
}