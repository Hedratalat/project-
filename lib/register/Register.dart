import 'dart:ui';


import 'package:project/Services.dart';
import 'package:project/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../First page.dart';
import 'register_controller.dart';

void main() {
  runApp(Register());
}

class Register extends StatelessWidget {
  Color mainColor = Color(0xFF5B8AB0);
  Color backgroundColor = Color(0xFFF5F5F5);
  Color textColor = Color(0xFF294964);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Form',
      theme: ThemeData(
      ),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _anotherEmailController = TextEditingController();
  String? _selectedGender;
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              title: Text('Registration Form'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/sign-up.png'),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controller.usernameController,
                            decoration: InputDecoration(labelText: 'Username'),
                            validator: (value) => value!.isEmpty ? 'Please enter your username' : null,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(labelText: 'Email'),
                            validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.gemailController,
                            decoration: InputDecoration(labelText: 'Confirm Email'),
                            validator: (value) {
                              if (value!.isEmpty) return 'Please confirm your email';
                              if (value != controller.gemailController.text) return 'Emails do not match';
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.passwordController,
                            decoration: InputDecoration(labelText: 'Password'),
                            validator: (value) => value!.isEmpty ? 'Please enter your password' : null,
                            obscureText: true,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(labelText: 'Confirm Password'),
                            validator: (value) {
                              if (value!.isEmpty) return 'Please confirm your password';
                              if (value !=controller.passwordController.text) return 'Passwords do not match';
                              return null;
                            },
                            obscureText: true,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.addressController,
                            decoration: InputDecoration(labelText: 'Address'),
                            validator: (value) => value!.isEmpty ? 'Please enter your address' : null,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: controller.phoneController,
                            decoration: InputDecoration(labelText: 'Phone Number'),
                            validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _anotherEmailController,
                            decoration: InputDecoration(labelText: 'Another Email'),
                            validator: (value) => value!.isEmpty ? 'Please enter your another email' : null,
                          ),
                          SizedBox(height: 10),
                          DropdownButtonFormField<String>(
                            value: _selectedGender,
                            onChanged: (String? newValue) => setState(() => _selectedGender = newValue),
                            items: ['Male', 'Female'].map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            )).toList(),
                            decoration: InputDecoration(labelText: 'Gender'),
                            validator: (value) => value == null ? 'Please select your gender' : null,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: _selectedMonth,
                                  onChanged: (String? newValue) => setState(() => _selectedMonth = newValue),
                                  items: List.generate(12, (index) => (index + 1).toString())
                                      .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  )).toList(),
                                  decoration: InputDecoration(labelText: 'Month'),
                                  validator: (value) => value == null ? 'Please select month' : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: _selectedDay,
                                  onChanged: (String? newValue) => setState(() => _selectedDay = newValue),
                                  items: List.generate(31, (index) => (index + 1).toString())
                                      .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  )).toList(),
                                  decoration: InputDecoration(labelText: 'Day'),
                                  validator: (value) => value == null ? 'Please select day' : null,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: _selectedYear,
                                  onChanged: (String? newValue) => setState(() => _selectedYear = newValue),
                                  items: List.generate(100, (index) => (2022 - index).toString())
                                      .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  )).toList(),
                                  decoration: InputDecoration(labelText: 'Year'),
                                  validator: (value) => value == null ? 'Please select year' : null,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  var date=_selectedMonth.toString()+_selectedDay.toString()+
                                      _selectedYear.toString();
                                  controller.selectedBrithDate=int.parse(date);
                                  controller.update();
                                  print("validate");
                                  controller.fetchRegister(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor, // Set the background color of the button to black
                              ),
                              child: Text('Register'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );}
    );
  }

// Future<void> _register() async {
//   final response = await http.post(
//     Uri.parse('http://localhost:3000/api/register'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'name': _usernameController.text,
//       'email': _emailController.text,
//       'password': _passwordController.text,
//       'gmail': _anotherEmailController.text,
//       'address': _addressController.text,
//       'phone': _phoneController.text,
//       'dateOfBirth': '$_selectedYear-$_selectedMonth-$_selectedDay',
//       'role': _selectedGender!,
//     }),
//   );
//
//   if (response.statusCode == 200) {
//     final snackBar = SnackBar(content: Text('Registration successful!'));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   } else {
//     final snackBar = SnackBar(content: Text('Registration failed!'));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
}