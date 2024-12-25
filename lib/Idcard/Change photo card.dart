import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../Services.dart';
import 'Idcard_Controller.dart';
import 'image_helper.dart';

class Idcard extends StatelessWidget {






  final imageHelper = ImageHelper();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IdcardController>(
        init: IdcardController(),
    builder: (controller) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          'Change Photo Card',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Image.asset('images/idcardScreen++.png'),
                ),
              ),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              controller.image == null
                  ? Text('No image selected.')
                  : Image.file(controller.image!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:()async {
                  final pickedFile = await imageHelper
                      .pickImageFromGallery();
                  if (pickedFile.isNotEmpty) {
                    if (pickedFile.first != null) {
                      controller.image =
                          File(pickedFile.first.path);
                      controller.update();
                    } else {
                      print('No image selected.');
                    }
                  }
                },
                child: Text('Upload New Picture'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){ controller.confirm(context);},
                child: Text('Confirm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );});
  }
}



