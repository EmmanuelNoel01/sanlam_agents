// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'home.dart';
import 'settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    Home(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: tabs[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Icon(Icons.home_outlined),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Icon(Icons.settings_outlined),
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.blue,
            iconSize: 30,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 50, 
            bottom: 20, 
            child: ClipOval(
              child: Image.asset(
                'assets/bottomnav.png',
                width: 80, 
                height: 80, 
                fit: BoxFit.cover, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}