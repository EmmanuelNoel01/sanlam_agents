// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name = "John Doe";
  String email = "johndoe@gmail.com";
  String address = "";
  String dateOfBirth = "";
  String phone = "";

  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = address;
    dateOfBirthController.text = dateOfBirth;
    phoneController.text = phone;
  }

  @override
  void dispose() {
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
      automaticallyImplyLeading: false,
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
                // GestureDetector(
                //   onTap: (){
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(builder: (context) => LogIn()),
                //     );
                //   },
                //   child: Text("LOGOUT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                // ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView( 
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 32.0),
            _buildSettingField("ADDRESS", addressController),
            _buildSettingField("DATE OF BIRTH", dateOfBirthController),
            _buildSettingField("PHONE", phoneController),
            SizedBox(height: 20), 
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {  
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
            SizedBox(height: 100), // Add spacing at the bottom
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