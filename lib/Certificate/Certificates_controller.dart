import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../Services.dart';
import '../apis/student_api.dart';
import 'CertificateModel.dart';
class CertificatesController extends GetxController {
  StudentApi studentApi = StudentApi();
  var Certificate = CertificateModel().obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController certificateTypeController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }

  void fetchcertificates(BuildContext context) async {
    var response = await studentApi.getcertificatesScreen(
        usernameController.text,
        certificateTypeController.text,
    );


        if (response["status"] == "success") {
      print("success" + "success");
      Certificate.value = CertificateModel.fromJson(response);
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
