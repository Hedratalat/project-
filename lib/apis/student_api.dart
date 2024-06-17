
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../constants.dart';



class StudentApi {
  final dio = Dio(BaseOptions(baseUrl:apiBaseUrl));

  Future<dynamic> getRegister(
      String name,
      String email,
      String password,
      String gmail,
      String role,
      String address,
      String phone,
      int dateOfBrith,

      ) async {

print("MERNA"+name+" "+email+" "+password+" "+gmail+" "+role+" "+address+" "+phone+" "+dateOfBrith.toString());

    final Map<String, dynamic> userData = {
      "name": name, // Placeholder value
      "email":email,
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
        'register',
        data: userData,
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
  Future<dynamic> getLogIn(
      String email,
      String password,
      ) async {
    final Map<String, dynamic> LogInData = {
      "email": email,
      "password": password,

    };

    final response = await dio.post(
      'login',
      data: LogInData,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else   {
      return null;
    }
  }




}