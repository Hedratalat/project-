import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'Activities_controller.dart';

class activitiesScreen extends StatefulWidget {
  @override
  State<activitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<activitiesScreen> {
  final Color mainColor = Color(0xFF5B8AB0);
  final Color backgroundColor = Color(0xFFF5F5F5);
  final Color textColor = Color(0xFF294964);

  List<String> activities = [
    'Sports Activity ',
    'Cultural activity',
    'Literary activity',
  ];



  @override
  Widget build(BuildContext context) {
    return GetBuilder<activitiesController>(
        init: activitiesController(),
    builder: (controller) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: mainColor,
        title: Text('Activities', style: TextStyle(
        color: Colors.white,),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Image.asset('images/ActivityScreen.png'),
                ),
              ),
              SizedBox(height: 55),
              TextFormField(
                controller: controller.StudentNameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              DropdownButtonFormField<String>(
                value: controller.selectedActivity,
                onChanged: (newValue) {
                  setState(() {
                   controller. selectedActivity = newValue;
                   controller.update();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Activity',
                  border: OutlineInputBorder(),
                ),
                items: activities.map((activity) {
                  return DropdownMenuItem(
                    value: activity,
                    child: Text(activity),
                  );
                }).toList(),
              ),
              SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  if (controller.selectedActivity != "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('You have selected: ${controller.selectedActivity}'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                controller.fetchactivities(context);

                              },
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
                          title: Text('Error'),
                          content: Text('Please select an activity'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0, // ارتفاع الـ Container
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