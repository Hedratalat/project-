

import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../ChangePassword.dart';
import 'log_in_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 

  bool _isPassword = true;
  Color mainColor = Color(0xFF5B8AB0);
  Color backgroundColor = Color(0xFFF5F5F5);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
        init: LogInController(),
        builder: (controller) {
          return Scaffold
            (
        appBar: AppBar(
          backgroundColor: mainColor, iconTheme: IconThemeData(
          color: Colors.white,),
          title: Text('Login', style: TextStyle(
            color: Colors.white,),
          ),

        ),

      
        body: Padding(
      
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('images/login.png'),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 47.0,
                      fontWeight: FontWeight.bold,
      
                    ),
                  ),
                  Text(
                    'welcome back we missed you',
                    style: TextStyle(
                      fontSize: 20.0,
      
      
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  TextFormField(
                    controller:controller.emailIogInController ,
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: controller.passwordIogInController,
                    obscureText: _isPassword,
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: togglePaswword(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // SizedBox(height: 5.0,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //   'Forgot Password ?',
                  // ),
                  //   ],
                  // ),
                  // ---------------------------------------------------------------
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChangePassword()),
                          );
                        },
                        child:
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),],
                  ),
      
                  SizedBox(height: 10.0,),
                  Container(
                    width: double.infinity,
                    color: mainColor,
                    child: MaterialButton(onPressed: ()
                    {
                      controller.fetchLogIn(context);


                    },
                      child: Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
      
                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
      );
        }
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