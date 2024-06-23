import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'Scholarships_controller.dart';

class scholarshipsScreen extends StatefulWidget {
  @override
  _ScholarshipsScreenState createState() => _ScholarshipsScreenState();
}

class _ScholarshipsScreenState extends State<scholarshipsScreen> {
  final Color mainColor = Color(0xFF5B8AB0);
  final Color backgroundColor = Color(0xFFF5F5F5);
  final Color textColor = Color(0xFF294964);

  List<String> scholarships = [
    'Tech Innovation Scholarship',
    'Social Leadership Scholarship',
    'Academic Excellence Scholarship',
    'Artistic Innovation Scholarship',
  ];



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScholarshipsController>(
        init: ScholarshipsController(),
    builder: (controller) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: mainColor,
        title: Text('Scholarships', style: TextStyle(
          color: Colors.white,),
      ),
        ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Image.asset('images/ScholarshipsScreen2.png'),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: controller.GpaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'GPA',
                  prefixIcon: Icon(Icons.label_important_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: controller.selectedScholarship,
                onChanged: (newValue) {
                  setState(() {
                    controller.selectedScholarship = newValue;
                    controller.update();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Scholarship',
                  border: OutlineInputBorder(),
                ),
                items: scholarships.map((scholarship) {
                  return DropdownMenuItem(
                    value: scholarship,
                    child: Text(scholarship),
                  );
                }).toList(),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('We will send you the remaining details by email..'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              controller.fetchScholarships(context);
                             // Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  color: mainColor,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );});
  }
}