import 'package:flutter/material.dart';
import 'Activities/Activities.dart';
import 'Certificate/Certificates.dart';
import 'Idcard/Change photo card.dart';
import 'Complaints/Complaints.dart';
import 'CourseRegistration/Course Registration.dart';
import 'Scholarships/Scholarships.dart';

//import 'package:popup_menu/popup_menu.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

Color mainColor = Color(0xFF5B8AB0);
Color backgroundColor = Color(0xFFF5F5F5);
Color textColor = Color(0xFF294964);

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: mainColor,
        title: Text(
          'Services',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, 80, 0, 0),
                items: [
                  PopupMenuItem(
                    child: Text(' Dear Students..Quiz(3) will cover RNN LSTMand Stacked LSTM sections.     '),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('   '),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text('Dear Students..  For sections 6&11 IIS additional Section will be Tomorrow at 10:00 AM.   '),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text('   '),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text('Dear All. I hope you are fine.  Quiz 1 for the web (3) course will be online and will be available for you during office hours on [Saturday 29/6/2024'),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text('   '),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text('Dear All.   Quiz 1 for the web (3) course will be online and will be available for you during office hours on [Saturday 29/6/2024] '),
                    value: 5,
                  ),

                ],
              ).then((value) {
                if (value != null) {
                  print("Selected notification: $value");
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Complaints()),
                  );
                },
                child: Container(
                  height: 166.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        child: Container(
                          width: 200.0,
                          child: Image.asset(
                            'images/Complaints.png',
                          ),
                        ),
                      ),
                      SizedBox(width: 45.0), // تحديد التباعد بين الصورة والنص
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 38.0),
                        child: Positioned(
                          child: Container(
                            child: Text(
                              'Complaints',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // بقية العناصر
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => scholarshipsScreen()),
                  );
                },
                child: Container(
                  height: 166.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 200.0,
                        child: Image.asset(
                          'images/Scholarships.png',
                        ),
                      ),
                      SizedBox(width: 45.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36.0),
                        child: Text(
                          'Scholarships',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => certificatesScreen()),
                  );
                },
                child: Container(
                  height: 166.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black12,

                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 200.0,
                        child: Image.asset(
                          'images/Certificates.png',
                        ),
                      ),
                      SizedBox(width: 45.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36.0),
                        child: Text(
                          'Certificates',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: textColor,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CourseRegistration()),
                  );
                },
                child: Container(
                  height: 166.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 200.0,
                        child: Image.asset(
                          'images/Course Registration.png',
                        ),
                      ),
                      SizedBox(width: 45.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36.0),
                        child: Text(
                          'Course \nRegistration',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: textColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  activitiesScreen()),
                  );
                },
                child: Container(
                  height: 166.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 200.0,
                        child: Image.asset(
                          'images/Activities.png',

                        ),
                      ),
                      SizedBox(width: 45.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36.0),
                        child: Text(
                          'Activities',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: textColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Idcard()),
                  );
                },
                child: Container(
                  height: 166.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 200.0,
                        child: Image.asset(
                          'images/changeidcard.png',
                        ),
                      ),
                      SizedBox(width: 45.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36.0),
                        child: Text(
                          'ID Card',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: textColor
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}