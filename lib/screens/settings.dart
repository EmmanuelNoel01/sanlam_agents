// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name = "John Doe";
  String email = "johndoe@gmail.com";
  String address = "";
  String dateOfBirth = "";
  String phone = "";

  // Controllers for the text fields
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current values
    addressController.text = address;
    dateOfBirthController.text = dateOfBirth;
    phoneController.text = phone;
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    addressController.dispose();
    dateOfBirthController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 300,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("My Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Icon(Icons.person, size: 100, color: Colors.white,),
                ),
                SizedBox(height: 20),
                Text(name, style: TextStyle(fontSize: 18, color: Colors.white)),
                SizedBox(height: 5),
                Text(email, style: TextStyle(fontSize: 18, color: Colors.white)),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: (){},
                  child: Text("LOGOUT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 32.0),
            _buildSettingField("ADDRESS", addressController),
            _buildSettingField("DATE OF BIRTH", dateOfBirthController),
            _buildSettingField("PHONE", phoneController),
            Spacer(),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Save changes functionality
                  setState(() {
                    address = addressController.text;
                    dateOfBirth = dateOfBirthController.text;
                    phone = phoneController.text;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size.fromHeight(48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
                ),
                child: Text("Save", style: TextStyle(fontSize: 18, color: Colors.white)),
                
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
                // SizedBox(height: 2.0),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Focus on the text field when the icon is pressed
              FocusScope.of(context).requestFocus(FocusNode());
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
      ),
    );
  }
}