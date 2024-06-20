
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis/student_api.dart';
import '../Services.dart';


class activitiesController extends GetxController {
  StudentApi studentApi = StudentApi();

  // var logInSuccess = LogInSuccessModel().obs;


  TextEditingController StudentNameController = TextEditingController();
  String? selectedActivity;

  @override
  void onInit() {

    super.onInit();
  }


  void fetchactivities(BuildContext context) async {
    print("objectggg"+selectedActivity.toString()+ " "+ StudentNameController.text);
    var responseLogIn = await studentApi.addSports(
        selectedActivity.toString(), StudentNameController.text);

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
