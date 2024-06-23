import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Services.dart';
import '../apis/student_api.dart';
import 'IdcardModel.dart';
import 'dart:io';

class IdcardController extends GetxController {
  StudentApi studentApi = StudentApi();
  var Idcard = IdcardModel().obs;
  File? image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update;
    }
  }

  void confirm(BuildContext context) {
    if (image != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content:
                Text("Your profile picture has been changed successfully."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter your name and select a picture."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  fetchIdcard(context);
                  // Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  void fetchIdcard(BuildContext context) async {
    var response = await studentApi.getIdcard(
      nameController.text,
      image,
    );

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
