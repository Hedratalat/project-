
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../constants.dart';



class StudentApi {
  final dio = Dio(BaseOptions(baseUrl: apiBaseUrl));

  Future<dynamic> getRegister(String name,
      String email,
      String password,
      String gmail,
      String role,
      String address,
      String phone,
      int dateOfBrith,) async {
    print("MERNA" + name + " " + email + " " + password + " " + gmail + " " +
        role + " " + address + " " + phone + " " + dateOfBrith.toString());

    final Map<String, dynamic> userData = {
      "name": name, // Placeholder value
      "email": email,
      "password": password,
      "gmail": gmail,
      "role": role,
      "address": address,
      "phone": phone,
      "dateOfBirth": dateOfBrith,
    };
    // "name":"nbbb",
    //     "email":"hg@hg.com",
    //     "password":"123456",
    //     "gmail":"romany",
    //     "role":"user",
    //     "address":"assiut",
    //     "phone":"01234567894",
    //     "dateOfBirth":123456


    try {
      final response = await dio.post(
        'users/register',
        data: userData,
      );

      if (response.statusCode == 201) {
        return response.data;
      } else if (response.statusCode == 400) {
        return Get.snackbar(
          "",
          "Username already exists",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          // icon: const Icon(Icons.add_alert),
        );
      } else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  /////////////////////////////////////////
  Future<dynamic> getLogIn(
      String email,
      String password,
      ) async {
    final Map<String, dynamic> LogInData = {
      "email": email,
      "password": password,

    };

    final response = await dio.post(
      'users/login',
      data: LogInData,
    );
    if (response.statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 400)  {
      return  Get.snackbar(
        "",
        " البريد الالكترونى غير صحيح",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );

    }else {
      return null;
    }
  }

/////////////////////////////////////////  /////////////////////////////////////////
  Future<dynamic> addSports(
      String typeactivity,
      String name,
      ) async {
    final Map<String, dynamic> LogInData = {
      "typeactivity": typeactivity,
      "name": name,

    };

    final response = await dio.post(
      'sports/addsports',
      data: LogInData,
    );
    if (response.statusCode == 201) {
      return response.data;
    }else {
      return null;
    }
  }

/////////////////////////////////////////

  Future<dynamic> getcertificatesScreen(String name,
      String certificateType,
      String imageUrl,) async {
    print("" + name + " " + certificateType + " " + imageUrl + " ".toString());

    final Map<String, dynamic> certificatesScreenData = {
      "name": name,
      "certificateType": certificateType,
      "imageUrl": imageUrl,


    };

    try {
      final response = await dio.post(
        'certificates',
        data: certificatesScreenData,
      );

      if (response.statusCode == 201) {
        return response.data;
      } else if (response.statusCode == 400) {
        return   Get.snackbar(
          "",
          "Username already exists",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          // icon: const Icon(Icons.add_alert),
        );

      }else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

/////////////////////////////////////////

  Future<dynamic> getIdcard(
      String level,
      String avatar,
      String studentId,
      ) async {
    print("" + level + " " + avatar + " " + studentId + " ".toString());

    final Map<String, dynamic> IdcardData = {
      "level": level,
      "avatar": avatar,
      "studentId": studentId,


    };

    try {
      final response = await dio.post(
        'IdcardData',
        data: IdcardData,
      );

      if (response.statusCode == 201) {
        return response.data;
      } else if (response.statusCode == 400) {
        return   Get.snackbar(
          "",
          "Username already exists",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          // icon: const Icon(Icons.add_alert),
        );

      }else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
/////////////////////////////////////////
  Future<dynamic> getActivities(
      String name,
      String typeactivity,

      ) async {
    print("" + name + " " + typeactivity + " ".toString());

    final Map<String, dynamic> ActivitiesData = {
      "name": name,
      "typeactivity": typeactivity,



    };

    try {
      final response = await dio.post(
        'Activities',
        data: ActivitiesData,
      );

      if (response.statusCode == 201) {
        return response.data;
      } else if (response.statusCode == 400) {
        return   Get.snackbar(
          "",
          "Username already exists",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          // icon: const Icon(Icons.add_alert),
        );

      }else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
/////////////////////////////////////////

}
