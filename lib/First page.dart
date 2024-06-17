import 'package:flutter/material.dart';
import 'package:project/register/Register.dart';

import 'Services.dart';
import 'log_in/LoginScreen.dart';


class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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