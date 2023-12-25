import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());

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

  void defaultLogin() {
    email = box.get('email');
    password = box.get('password');
    isEverLogedin = box.get('isEverLogedin');
    if (email != null && password != null) {
      getApi();
    } else {
      emit(UserLoginInitial());
    }
  }

  void logOut() {
    box.put("email", null);
    box.put('password', null);
    box.put('isEverLogedin', "true");
    currUser = User_model();
    currUser!.data = Data();
    isUserLogedIn = false;
    Get.back();
    emit(UserLoginInitial());
    Get.off(() => const Login());
    log("User Logout");
  }

  void userLogedinUpdate() {
    box.put("email", email);
    box.put('password', password);
    box.put('isEverLogedin', "true");
  }

  void validate() {
    emailError = emailValidator();
    passwordError = passwordValidator();
    emit(UserLoginValidation(
      emailError: emailError,
      passwordError: passwordError,
    ));
  }

  void ForgetPasswordvalidate() {
    forgetPasswordEmailError = ForgetPasswordemailValidator();
    emit(UserForgetPasswordValidation(
      forgetPasswordEmailError: forgetPasswordEmailError,
    ));
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

  void getApi() async {
    emit(UserLoginLoading());
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
        emit(UserLoginSuccess(userModel: user_model!));
      } else {
        loaderHide();
        showSnackBar(title: "Login Failed", message: user_model!.message);
        currUser = User_model();
        currUser!.data = Data();
        emit(UserLoginFailure(errorMessage: user_model!.message));
      }
    } else {
      currUser = User_model();
      currUser!.data = Data();
      loaderHide();
      printError(info: "Not get data from login api");
      emit(UserLoginFailure(errorMessage: "Failed to log in"));
    }
  }

  void forgetPasswordApi() async {
    emit(UserForgetPasswordLoading());
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
        emit(UserForgetPasswordSuccess());
      } else {
        showSnackBar(
          title: "Failed",
          message: result['message'],
        );
        loaderHide();
        emit(UserForgetPasswordFailure(errorMessage: result['message']));
      }
    } else {
      loaderHide();
      printError(info: "Not get data from ForgetPassword api");
      emit(UserForgetPasswordFailure(errorMessage: "Failed to reset password"));
    }
  }

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        print(googleSignInAccount.displayName);
        print(googleSignInAccount.email);
        showSnackBar(
            title: "Success",
            color: Colors.green,
            isSuccess: true,
            message: "Successfully logged in with Google Sign-In");
      }
    } catch (error) {
      print(error);
    }
  }

  void socialMediaBtn() {
    emit(UserSocialMediaLoading());
    Bounce(
      onPressed: (() {
        _handleSignIn();
      }),
      duration: const Duration(milliseconds: 100),
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/google_icon.png'))),
      ),
    );
    emit(UserSocialMediaSuccess());
  }
}
