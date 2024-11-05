// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {
  String name = "John Doe";
  String email = "johndoe@gmail.com";
  String address = "";
  String dateOfBirth = "";
  String phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        actions: [
          TextButton(
            onPressed: () {
              // Logout functionality
            },
            child: Text("LOGOUT"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/profile_image.png"),
            ),
            SizedBox(height: 16.0),
            Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(email, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16.0),
            _buildSettingField("Address", address),
            _buildSettingField("Date of Birth", dateOfBirth),
            _buildSettingField("Phone", phone),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Save changes functionality
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set the current index to the settings page
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingField(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: TextField(
              controller: TextEditingController(text: value),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}