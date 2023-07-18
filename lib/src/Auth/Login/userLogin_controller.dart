// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_model.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_view.dart';
import 'package:gleekey_user/src/HomePage/homePage_view.dart';
import 'package:gleekey_user/src/Intro_pages/onBoard.dart';
import 'package:gleekey_user/src/Intro_pages/onBoard_screen.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashboard_controller.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/widgets/loder.dart';
import 'package:gleekey_user/widgets/showSnackBar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class UserLoginController extends GetxController {
  User_model? user_model;

  TextEditingController emailController = TextEditingController();
  TextEditingController ForgetemailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? forgetPasswordEmailError;
  String? passwordError;

  bool isUserLogedIn = false;
  bool isValidate = false;
  bool isForgetPasswordValidate = false;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? email, password, isEverLogedin;
  String? forgetPasswordEmail;
  var currpage;

  final box = Hive.box('gleekey');

  @override
  void onInit() {
    log("trying for default login");
    defaultLogin();
    // if (isUserLogedIn) {
    //   Get.to(() => HomePage());
    // } else if (isEverLogedin == "true") {
    //   Get.to(() => HomePage());
    // } else {
    //   Get.to(() => OnBoardScreen());
    // }
    super.onInit();
  }

  @override
  void onClose() {
    TextEditingController emailController = TextEditingController(text: null);
    TextEditingController passwordController =
        TextEditingController(text: null);
    update();
    super.onClose();
  }

  getApi() async {
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.login),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      var result = json.decode(response.body);
      user_model = User_model.fromJson(result);
      if (user_model!.status == true) {
        currUser = user_model!;
        isUserLogedIn = true;
        userLogedinUpdate();
        log("UserLoginController --> Login Success : " + email!);
        loaderHide();
        Get.off(() => const HomePage());
      } else {
        loaderHide();
        showSnackBar(title: "Login Failed", message: user_model!.message);
        currUser = User_model();
        currUser!.data = Data();
      }
    } else {
      currUser = User_model();
      currUser!.data = Data();
      loaderHide();
      printError(info: "Not get data from login api");
    }
    update();
  }

  forgetPasswordApi() async {
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.forgetPassword),
      body: {
        'email': forgetPasswordEmail,
      },
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result['status']) {
        loaderHide();
        showSnackBar(
            title: "Sucsess",
            message: result['message'],
            color: Colors.green,
            isSuccess: true);
        Get.offAll(() => const Login());
        emailController.text = ForgetemailController.text;
      } else {
        showSnackBar(
          title: "Failed",
          message: result['message'],
        );
        loaderHide();
      }
    } else {
      loaderHide();
      printError(info: "Not get data from ForgetPassword api");
    }
    update();
  }

  validate() {
    emailError = emailValidator();
    passwordError = passwordValidator();
    update();
  }

  ForgetPasswordvalidate() {
    forgetPasswordEmailError = ForgetPasswordemailValidator();
    update();
  }

  String? emailValidator() {
    if (emailController.text.isEmpty) {
      return "Enter Correct Email/Phone Number";
    } else {
      return null;
    }
  }

  String? ForgetPasswordemailValidator() {
    if (ForgetemailController.text.isEmpty) {
      return "Enter Correct Email";
    } else {
      return null;
    }
  }

  String? passwordValidator() {
    if (passwordController.text.isEmpty) {
      return "Enter Correct Password";
    } else {
      return null;
    }
  }

  userLogedinUpdate() {
    box.put("email", email);
    box.put('password', password);
    box.put('isEverLogedin', "true");
  }

  defaultLogin() {
    email = box.get('email');
    password = box.get('password');
    isEverLogedin = box.get('isEverLogedin');
    if (email != null && password != null) {
      getApi();
    } else {
      currUser = User_model();
      currUser!.data = Data();
    }
    update();
  }

  logOut() {
    box.put("email", null);
    box.put('password', null);
    box.put('isEverLogedin', "true");
    currUser = User_model();
    currUser!.data = Data();
    isUserLogedIn = false;
    Get.back();
    update();
    Get.off(() => const Login());
    log("User Logout");
  }
}
