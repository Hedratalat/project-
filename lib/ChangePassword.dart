import 'package:flutter/material.dart';

import 'Services.dart';



class ChangePassword  extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var emailController = TextEditingController();

  var usernameController = TextEditingController();

  var password = TextEditingController();

  var confirmpassword = TextEditingController();

  bool _isPassword = true;
  Color mainColor = Color(0xFF5B8AB0);
  Color backgroundColor = Color(0xFFF5F5F5);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:  mainColor,
        title: Text('Change Your Password',style: TextStyle(
        color: Colors.white,),

     // extendBodyBehindAppBar: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.0), // Adjust the value as needed
                  child: Image.asset('images/changepassword 2.png'),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 30.0), // Adjust the value as needed
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0), // Adjust the value as needed
                  child: TextFormField(
                    controller: usernameController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: TextFormField(
                    obscureText: _isPassword,
                    controller: password,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: togglePaswword(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: TextFormField(
                    obscureText: _isPassword,
                    controller: confirmpassword,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon:togglePaswword(),
                      border: OutlineInputBorder(),

                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  width: double.infinity,
                  color: mainColor,
                  child: MaterialButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          usernameController.text.isNotEmpty &&
                          password.text.isNotEmpty &&
                          confirmpassword.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ServicesScreen()),
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Success"),
                              content: Text("Password changed successfully"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Please fill in all fields"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],),
          ),
        ),
      ),
    );
  }

  Widget togglePaswword() {
    return IconButton(onPressed: () {
      setState(() {
        _isPassword = !_isPassword;
      });
    }, icon: _isPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
      color: Colors.grey,);
  }
}