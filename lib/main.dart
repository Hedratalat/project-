

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'First page.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(
 debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }

}