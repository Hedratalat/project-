
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis/student_api.dart';
import '../Services.dart';


class ScholarshipsController extends GetxController {
  StudentApi studentApi = StudentApi();

  TextEditingController nameController = TextEditingController();
  TextEditingController GpaController = TextEditingController();
  String? selectedScholarship;


  @override
  void onInit() {

    super.onInit();
  }


  void fetchScholarships(BuildContext context) async {
    print("objectggg"+ " "+ nameController.text);
    var response = await studentApi.getScholarships(
        nameController.text, selectedScholarship.toString());

    print(response);
      if (response['status'] == "success") {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } else {
        Get.snackbar(
          "",
          " البريد الالكترونى غير صحيح",
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }

      update();

  }
}
