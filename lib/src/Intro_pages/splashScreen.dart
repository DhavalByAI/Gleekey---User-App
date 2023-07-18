import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:flutter/material.dart';
import 'package:gleekey_user/src/HomePage/homePage_view.dart';
import 'package:gleekey_user/src/Intro_pages/onBoard_screen.dart';
import 'package:gleekey_user/utils/style/constants.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserLoginController getController = Get.put(UserLoginController());
    return GetBuilder<UserLoginController>(
      initState: (_) {},
      builder: (_) {
        return EasySplashScreen(
          showLoader: false,
          logoWidth: MediaQuery.of(context).size.width * 0.7,
          logo: Image.asset(
            "assets/images/spalsh.png",
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          backgroundColor: kmatblack,
          navigator: (_.isUserLogedIn || _.isEverLogedin == "true")
              ? const HomePage()
              : const OnBoardScreen(),
          durationInSeconds: 3,
        );
      },
    );
  }
}
