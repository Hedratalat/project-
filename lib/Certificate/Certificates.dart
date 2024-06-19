
import 'package:flutter/material.dart';
import 'package:project/Certificate/photoCertificate.dart';


class certificatesScreen extends StatefulWidget {
  @override
  State<certificatesScreen> createState() => _certificatesScreenState();
}

class _certificatesScreenState extends State<certificatesScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController certificateTypeController = TextEditingController();
  final TextEditingController    imageUrlController = TextEditingController();

  String? selectecertificates;

  Color mainColor = Color(0xFF5B8AB0);
  Color backgroundColor = Color(0xFFF5F5F5);
  Color textColor = Color(0xFF294964);

  List<String> certificates = [
    'Graduation certificate',
    'Proof of registration',
    'Transcript of grades',
  ];

  @override
  Widget build(BuildContext context) {
    var selectedCertificate;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: mainColor,
          title: Text('Certificates', style: TextStyle(
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
                    child: Image.asset('images/certificatescreen.png'),
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Student Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 35),
                  DropdownButtonFormField<String>(
                    value: selectecertificates,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCertificate = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Certificate',
                      border: OutlineInputBorder(),
                    ),
                    items: certificates.map((certificate) {
                      return DropdownMenuItem(
                        value: certificate,
                        child: Text(certificate),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 70),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => photoCertificate()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                    ),
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