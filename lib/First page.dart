import 'package:flutter/material.dart';
import 'package:project/register/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Services.dart';
import 'log_in/LoginScreen.dart';


class FirstPage  extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {

    _loadData();

    super.initState();
  }

  // Load data from SharedPreferences
  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(  prefs.getString("token")!=null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ServicesScreen ()),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/home0.png'),
                SizedBox(height: 10),
                Image.asset('images/home1.gif'),
                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                      ),
                      child: Text('Login',style:TextStyle(color: Colors.white),
                    ),
                    ),
                    SizedBox(width: 40), // Adds some space between the buttons
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                      ),
                      child: Text('Sign Up',style:TextStyle(color: Colors.white),
                    ),
                    ),
                  ],
                ),
              ],
            ),
            ),
        );
    }
}