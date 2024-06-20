
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis/student_api.dart';
import '../Services.dart';


class CourseRegistrationController extends GetxController {
  StudentApi studentApi = StudentApi();

  // var logInSuccess = LogInSuccessModel().obs;


  TextEditingController nameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();


  @override
  void onInit() {

    super.onInit();
  }


  void fetchactivities(BuildContext context) async {
    print("objectggg"+gradeController.toString()+ " "+ nameController.text);
    var responseLogIn = await studentApi.addSports(
        gradeController.toString(), nameController.text);

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
