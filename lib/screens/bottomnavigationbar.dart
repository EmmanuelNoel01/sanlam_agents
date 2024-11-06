// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';


class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black, 
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined, color: Colors.blue),
    iconSize: 45,
                onPressed: () {},
              ),
              SizedBox(width: 48),
              IconButton(
                icon: Icon(Icons.settings_outlined, color: Colors.grey),
    iconSize: 45,
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
  width: 100, 
  height: 100, 
  child: FloatingActionButton(
    onPressed: () {},
    backgroundColor: Colors.white,
    child: Image.asset(
      'assets/otp.png', 
      width: 100,
      height: 100,
    ),
    shape: CircleBorder(
      side: BorderSide(color: Colors.black), 
    ),
  ),
),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
