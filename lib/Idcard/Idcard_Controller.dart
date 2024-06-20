import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../Services.dart';
import '../apis/student_api.dart';
import 'IdcardModel.dart';
class IdcardController extends GetxController {
  StudentApi studentApi = StudentApi();
  var Idcard = IdcardModel().obs;

  TextEditingController levelController = TextEditingController();
  TextEditingController avatarController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }  void fetchRegister(BuildContext context) async {
    var response = await studentApi.getIdcard(
        levelController.text,
        avatarController.text,
        studentIdController.text);

        if (response["status"] == "success") {
      print("success" + "success");
      Idcard.value = IdcardModel.fromJson(response);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ServicesScreen()),
      );
    } else {
    Get.snackbar(
    "",
    "رقم الهاتف او البريد الالكترونى مستخدم من قبل".tr,
    colorText: Colors.white,
    backgroundColor: Colors.red,
    // icon: const Icon(Icons.add_alert),
    );
    }

    update();
    // }
  }
}


