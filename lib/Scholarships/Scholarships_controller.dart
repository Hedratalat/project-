
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis/student_api.dart';
import '../Services.dart';


class ScholarshipsController extends GetxController {
  StudentApi studentApi = StudentApi();

  // var logInSuccess = LogInSuccessModel().obs;


  TextEditingController nameController = TextEditingController();
  TextEditingController scholarshipController = TextEditingController();


  @override
  void onInit() {

    super.onInit();
  }


  void fetchactivities(BuildContext context) async {
    print("objectggg"+scholarshipController.toString()+ " "+ nameController.text);
    var responseLogIn = await studentApi.addSports(
        scholarshipController.toString(), nameController.text);

    if (responseLogIn != null) {
      if (responseLogIn['status'] == "success") {
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
}
