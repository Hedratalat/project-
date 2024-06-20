
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis/student_api.dart';
import '../Services.dart';


class ComplaintsController extends GetxController {
  StudentApi studentApi = StudentApi();

  // var logInSuccess = LogInSuccessModel().obs;


  TextEditingController studentIdController = TextEditingController();
  TextEditingController messageController = TextEditingController();


  @override
  void onInit() {

    super.onInit();
  }


  void fetchactivities(BuildContext context) async {
    print("objectggg"+messageController.toString()+ " "+ studentIdController.text);
    var responseLogIn = await studentApi.addSports(
        messageController.toString(), studentIdController.text);

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
