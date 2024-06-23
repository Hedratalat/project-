
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Services.dart';
import 'CourseRegistration_Controller.dart';


class CourseRegistration extends StatelessWidget {
  @override
  Color mainColor = Color(0xFF5B8AB0);
  Color backgroundColor = Color(0xFFF5F5F5);
  Color textColor = Color(0xFF294964);
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialRegistrationPage(),
    );
  }
}

class MaterialRegistrationPage extends StatefulWidget {
  @override
  _MaterialRegistrationPageState createState() =>
      _MaterialRegistrationPageState();
}

class _MaterialRegistrationPageState extends State<MaterialRegistrationPage> {
  String? _name;
  String? _selectedGrade;
  List<String> _selectedMaterials = [];

  final List<String> _grades = ['First Grade', 'Second Grade', 'Third Grade', 'Fourth Grade'];

  final Map<String, List<String>> _gradeMaterials = {
    'First Grade': ['Math 1', 'Science 1', 'History 1', 'Art 1', 'Physical Education 1'],
    'Second Grade': ['Math 2', 'Science 2', 'History 2', 'Art 2', 'Physical Education 2'],
    'Third Grade': ['Math 3', 'Science 3', 'History 3', 'Art 3', 'Physical Education 3'],
    'Fourth Grade': ['Math 4', 'Science 4', 'History 4', 'Art 4', 'Physical Education 4'],
  };

  void _navigateToCoursesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoursesPage(selectedMaterials: _selectedMaterials),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseRegistrationController>(
        init: CourseRegistrationController(),
    builder: (controller) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesScreen()),
            );
          },
        ),
        title: Text('Course Registration', style: TextStyle(
          color: Colors.white,),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('images/Course Registration2.png',width: 200,),
              // Change the path to your image

              SizedBox(height: 20),

              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;

                  });
                },
              ),
              SizedBox(height: 17.0),
              DropdownButtonFormField<String>(
                value:_selectedGrade,
                decoration: InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
                items: _grades.map((String grade) {
                  return DropdownMenuItem<String>(
                    value: grade,
                    child: Text(grade),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGrade = value;
                    _selectedMaterials.clear();
                  });
                },
              ),
              SizedBox(height: 20.0),
              _selectedGrade != null
                  ? Expanded(
                child: ListView(
                  children: _gradeMaterials[_selectedGrade]!.map((material) {
                    return CheckboxListTile(
                      title: Text(material),
                      value: _selectedMaterials.contains(material),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedMaterials.add(material);
                          } else {
                            _selectedMaterials.remove(material);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              )
                  : Container(),
              ElevatedButton(
                onPressed: () {
                  _navigateToCoursesPage(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                ),

                child: Text('Register',style:TextStyle(color: Colors.white),),

              ),
            ],
          ),
        ),

    );});
  }
}

class CoursesPage extends StatelessWidget {
  final List<String> selectedMaterials;

  CoursesPage({required this.selectedMaterials});

  get name => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back, color: Colors.white,),
        backgroundColor: mainColor, iconTheme: IconThemeData(
        color: Colors.white,),
        title: Text('Courses', style: TextStyle(
          color: Colors.white,),
        ),
      ),
      // appBar: AppBar(
      //   title: Text('Courses'),
      // ),
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: selectedMaterials.map((material) {
            return ListTile(
              title: Text(material),
            );
          }).toList(),
        ),
      ),

    );
  }
}
