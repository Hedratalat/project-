import 'package:flutter/material.dart';

class photocerticate extends StatelessWidget {

  Color mainColor = Color(0xFF5B8AB0);

  Color backgroundColor = Color(0xFFF5F5F5);

  Color textColor = Color(0xFF294964);

  final TextEditingController    imageUrlController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor ,
        title: Text('Picture of a certificate'),
      ),
      body: Center(
        child: Image.asset('images/gggg3.jpeg',),// صوره الشهاده للطالب
      ),
    );
  }
}