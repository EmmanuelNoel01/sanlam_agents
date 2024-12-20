import 'package:flutter/material.dart';
import 'package:sanlam_agents/screens/bottomnavigationbar.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Image.asset('assets/otp.png', width: 500, height: 500,),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 5.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      textAlign: TextAlign.center,
                      style:  TextStyle(color:Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      textAlign: TextAlign.center,
                      style:  TextStyle(color:Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      textAlign: TextAlign.center,
                      style:  TextStyle(color:Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue,width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      textAlign: TextAlign.center,
                      style:  TextStyle(color:Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                    );
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size.fromHeight(50.0),
                ),
              ),
            ),
            SizedBox(height: 16.0,),
            TextButton(
              onPressed: (){},
              child: Text(
                'Haven\'t Received the code? Resend',
                style: TextStyle(color: Colors.blue, fontSize: 15, decoration: TextDecoration.underline, decorationColor: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}