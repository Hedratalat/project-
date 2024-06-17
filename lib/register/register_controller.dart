import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services.dart';
import '../apis/student_api.dart';
import 'RegisterModel.dart';

class RegisterController extends GetxController {
  StudentApi studentApi = StudentApi();
  var Register = RegisterModel().obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedBrithDate = 0;
  String role = 'user';
  TextEditingController emailController = TextEditingController();
  TextEditingController gemailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController schoolNameController = TextEditingController();
  TextEditingController promoCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void fetchRegister(BuildContext context) async {
    var response = await studentApi.getRegister(
        usernameController.text,
        emailController.text,
        passwordController.text,
        gemailController.text,
        role,
        addressController.text,
        phoneController.text,
        selectedBrithDate);
    // if (response != null) {
    print(response.toString());
      if (response["status"] ==  "success") {
        print( "success"+ "success");
        Register.value = RegisterModel.fromJson(response);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ServicesScreen ()),
        );
      } else  {
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