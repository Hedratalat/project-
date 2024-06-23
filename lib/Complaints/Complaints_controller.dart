
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apis/student_api.dart';
import '../Services.dart';


class ComplaintsController extends GetxController {
  StudentApi studentApi = StudentApi();


  TextEditingController messageController = TextEditingController();


  @override
  void onInit() {

    super.onInit();
  }


  void fetchComplaint(BuildContext context) async {
    print("objectggg"+messageController.text.toString()+ " ");
    var response = await studentApi.getComplaints(
        messageController.text.toString());

    if (response != null) {
      if (response['status'] == "success") {
        SnackBar(
          content: Text('This is a Snackbar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Code to execute when the action is pressed.
            },
          ),
        );
        // // Navigator.of(context).pop();
        // Get.snackbar(
        //   "",
        //   "success",
        //   colorText: Colors.white,
        //   backgroundColor: Colors.green,
        // );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ServicesScreen ()),
        );
      } else {
        Get.snackbar(
          "",
          " try  anther ",
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }

      update();
    }
  }
}
