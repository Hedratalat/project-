import 'package:flutter/material.dart';

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
    'Activity 2',
    'Activity 3',
  ];

  String? selectedActivity;

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              DropdownButtonFormField<String>(
                value: selectedActivity,
                onChanged: (newValue) {
                  setState(() {
                    selectedActivity = newValue;
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
                  if (selectedActivity != null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('You have selected: $selectedActivity'),
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
    );
  }
}