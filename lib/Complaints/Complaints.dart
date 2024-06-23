import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Services.dart';
import 'Complaints_controller.dart';


//void main() { runApp(Complaints());}

class Complaints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complaints Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ComplaintsPage(),
    );
  }
}

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  String? selectedComplaintType;
  bool complaintSent = false;
  bool showImageUpload = false;

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplaintsController>(
        init: ComplaintsController(),
    builder: (controller) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Complaints Page', style: TextStyle(
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset('images/Complaints+.png'), // Change the path to your image

                  SizedBox(height: 0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller.messageController,
                    decoration: InputDecoration(
                      labelText: 'Your Complaints',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 10, // Allows the text field to expand vertically
                  ),

                  SizedBox(height: 20.0),
                  // TextField(
                  //   controller: studentIdController,
                  //   controller: idController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Your ID',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   margin: EdgeInsets.only(bottom: 20.0),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 2,
            //         blurRadius: 5,
            //         offset: Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: DropdownButtonFormField<String>(
            //     value: selectedComplaintType,
            //     hint: Text('Select Complaint Type'),
            //     items: ['Course Content and Teaching Methods', 'Lack of Practical Applications', ' Outdated Course Materials']
            //         .map((type) => DropdownMenuItem(
            //       child: Text(type),
            //       value: type,
            //     ))
            //         .toList(),
            //     onChanged: (value) {
            //       setState(() {
            //         selectedComplaintType = value;
            //       });
            //     },
            //     decoration: InputDecoration(
            //       labelText: 'Complaint Type',
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(10.0),
            //   margin: EdgeInsets.only(bottom: 20.0),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 2,
            //         blurRadius: 5,
            //         offset: Offset(0, 3),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     children: [
            //       // TextField(
            //       //   controller: messageController,
            //       //   controller: complaintController,
            //       //   maxLines: 5,
            //       //   decoration: InputDecoration(
            //       //     labelText: 'Complaint (You can add an image or file)',
            //       //     border: OutlineInputBorder(),
            //       //   ),
            //       // ),
            //       SizedBox(height: 20.0),
            //       IconButton(
            //         icon: Icon(Icons.attach_file),
            //         onPressed: () {
            //           setState(() {
            //             showImageUpload = !showImageUpload;
            //           });
            //         },
            //       ),
            //       if (showImageUpload)
            //         Container(
            //           width: double.infinity,
            //           height: 200.0,
            //           color: Colors.grey[200],
            //           child: Center(
            //             child: Text(
            //               'Image or File Attachment Area',
            //               style: TextStyle(color: Colors.black54),
            //             ),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
            ElevatedButton(
              onPressed: () {
                controller.fetchComplaint(context);

              },

              child: Text('Send Complaint'),
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
            SizedBox(height: 20.0),
            if (complaintSent)
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Thank you for your complaint! We will contact you as soon as possible to solve your problem.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green[900]),
                ),
              ),
          ],
        ),
      ),
    );});
  }
}
