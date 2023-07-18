import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_model.dart';

import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/widgets/loder.dart';
import 'package:gleekey_user/widgets/showSnackBar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../Login/userLogin_view.dart';

class UserResistorController extends GetxController {
  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    birthDateController = TextEditingController();
    super.onInit();
  }

  User_model? user_model;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  String? emailError;
  String? firstNameError;
  String? lastNameError;
  String? phoneError;
  String? passwordError;
  String? cnfmPasswordError;
  String? birthDateError;

  bool isValidate = false;

  String? email;
  String? password;

  DateTime? birthDate;

  final box = Hive.box('gleekey');

  getApi() async {
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.ragister),
      body: {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': passwordController.text,
        'confirm_password': confirmPasswordController.text,
        'user_host': '0'
      },
    );
    if (response.statusCode == 200) {
      if (json.decode(response.body)['status'].toString() == 'true') {
        showSnackBar(
            title: "Successfull",
            message: "User Registration Successfull",
            color: Colors.green,
            isSuccess: true);
        var result = json.decode(response.body);
        user_model = User_model.fromJson(result);
        UserLoginController _ = Get.find();
        // box.put("email", email);dHAVAK
        // box.put('password', password);
        // box.put('isEverLogedin', "true");
        log("UserResistorController -- > User Successfully Registreted");
        loaderHide();
        // _.defaultLogin();
        Get.off(() => const Login());
        _.emailController.text = emailController.text;
        _.passwordController.text = '';
      } else {
        loaderHide();
        showSnackBar(
            title: "Failed",
            message: json.decode(response.body)['message'].toString(),
            color: Colors.red,
            isSuccess: false);
      }
    } else {
      printError(info: "Something Went Wrong! Please Try Again!");
    }
    update();
  }

  validate() {
    log("Velidating");
    emailError = emailValidator();
    firstNameError = firstNameValidator();
    lastNameError = lastNameValidator();
    phoneError = phoneValidator();
    passwordError = passwordValidator();
    cnfmPasswordError = cnfmpasswordValidator();
    birthDateError = birthDateValidator();
    update();
  }

  String? emailValidator() {
    if (emailController.text.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(emailController.text)) {
      return "Enter Correct Email Address";
    } else {
      return null;
    }
  }

  String? firstNameValidator() {
    if (firstNameController.text.isEmpty ||
        !RegExp(r'^[a-z A-Z]+$').hasMatch(firstNameController.text)) {
      return "Enter Correct First Name";
    } else {
      return null;
    }
  }

  String? lastNameValidator() {
    if (lastNameController.text.isEmpty ||
        !RegExp(r'^[a-z A-Z]+$').hasMatch(lastNameController.text)) {
      return "Enter Correct Last Name";
    } else {
      return null;
    }
  }

  String? phoneValidator() {
    if (phoneController.text.isEmpty ||
        !RegExp(r'^([+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]).{8,}$')
            .hasMatch(phoneController.text)) {
      return "Enter Correct Phone Number";
    } else {
      return null;
    }
  }

  String? passwordValidator() {
    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      return "Enter Correct Password";
    } else {
      return null;
    }
  }

  String? cnfmpasswordValidator() {
    if (confirmPasswordController.text.isEmpty ||
        passwordController.text.length < 6) {
      return "Enter Correct Password";
    } else {
      return null;
    }
  }

  String? birthDateValidator() {
    try {
      DateTime? dateTime = DateTime.tryParse(birthDateController.text);
      if (birthDateController.text.isEmpty ||
          !(birthDateController.text == dateTime.toString().substring(0, 10))) {
        return "Enter Correct BirthDate";
      } else {
        return null;
      }
    } catch (e) {
      return "Enter Correct BirthDate";
    }
  }
}
