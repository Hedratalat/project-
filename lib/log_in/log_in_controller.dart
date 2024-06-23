
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apis/student_api.dart';
import '../Services.dart';
import 'LogInSuccessModel.dart';


class LogInController extends GetxController {
  StudentApi studentApi = StudentApi();

 var logInSuccess = loginModel().obs;


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
      if (responseLogIn['status'] == "success") {
        logInSuccess.value=  loginModel.fromJson(responseLogIn);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await  prefs.setString("studentId", logInSuccess.value.data!.id!);
        //sharedpref to save  user login
        await  prefs.setString("token", logInSuccess.value.data!.token!);


        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ServicesScreen ()),
        );

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
