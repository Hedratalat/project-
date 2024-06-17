
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis/student_api.dart';
import '../Services.dart';


class LogInController extends GetxController {
  StudentApi studentApi = StudentApi();

  // var logInSuccess = LogInSuccessModel().obs;


  TextEditingController emailIogInController = TextEditingController();
  TextEditingController passwordIogInController = TextEditingController();

@override
  void onInit() {

    super.onInit();
  }


  void fetchLogIn(BuildContext context) async {
    var responseLogIn = await studentApi.getLogIn(
        emailIogInController.text, passwordIogInController.text);

    if (responseLogIn != null) {
      if (responseLogIn['status'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ServicesScreen ()),
        );

      } else {
        Get.snackbar(
          "",
          "رقم الهاتف او البريد الالكترونى غير صحيح".tr,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }

      update();
    }
  }
}