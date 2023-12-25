// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Ragistration/register.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:gleekey_user/src/Auth/Ragistration/userRegister_controller.dart';
import 'package:gleekey_user/src/Auth/forgot_password.dart';
import 'package:gleekey_user/src/Auth/phone_login.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:gleekey_user/widgets/fade_slide_transition.dart';
import 'package:gleekey_user/widgets/loder.dart';
import 'package:gleekey_user/widgets/showSnackBar.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_common.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_password.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  AnimationController? _animationController;
  Animation<double>? _formElementAnimation;

  var space;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );
    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController!,
      curve: const Interval(
        0.45,
        0.8,
        curve: Curves.easeInOut,
      ),
    ));
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    UserLoginController getControler = Get.find();

    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    space = height > 650 ? kSpaceM : kSpaceS;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backGroudImage(),
            FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: Stack(
                  children: [
                    mainView(),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget backGroudImage() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              image: DecorationImage(
                  image: AssetImage('assets/images/login_background_image.png'),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: kBlack.withOpacity(0.4),
          ),
        )
      ],
    );
  }

  Widget mainView() {
    return Card(
        margin: EdgeInsets.only(
            right: 27, left: 27, top: MediaQuery.of(context).size.height / 4.0),
        shape: Palette.businessCardShape,
        elevation: 6,
        child: Container(
            //height: 465,
            padding: const EdgeInsets.all(20),
            child: GetBuilder<UserLoginController>(builder: ((_) {
              return Column(
                children: [
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: Text(
                      'Welcome To',
                      style: Palette.loginText,
                    ),
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 16,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/app_logo.png'))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: CustomTextfieldCommon(
                      controller: _.emailController,
                      label: 'email / phone number',
                      hint: 'enter your email / phone number',
                      textInputType: TextInputType.emailAddress,
                      validate: _.validate,
                      errorText: _.emailError,
                      btnValidate: _.isValidate,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: CustomTextfieldPass(
                      controller: _.passwordController,
                      label: 'Password',
                      hint: 'Password',
                      validate: _.validate,
                      errorText: _.passwordError,
                      btnValidate: _.isValidate,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: forgetPassword(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: loginBtn(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: registerBtn(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: SizedBox(
                            child: Divider(
                              color: kDarkGrey,
                              thickness: 0.7,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'or login with',
                          style: Palette.commonText1,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Expanded(
                          child: SizedBox(
                            child: Divider(
                              color: kDarkGrey,
                              thickness: 0.7,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeSlideTransition(
                      animation: _formElementAnimation!,
                      additionalOffset: space,
                      child: socialMediaBtn()),
                ],
              );
            }))));
  }

  Widget loginBtn() {
    return GetBuilder<UserLoginController>(
      initState: (_) {},
      builder: (_) {
        return MaterialButton(
            shape: Palette.subCardShape,
            color: kOrange,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: Center(
                child: Text(
                  'Login',
                  style: Palette.btnText,
                ),
              ),
            ),
            onPressed: () {
              _.isValidate = true;
              _.update();
              _.validate();
              if (_.emailError == null && _.passwordError == null) {
                loaderShow(context);
                _.email = _.emailController.text;
                _.password = _.passwordController.text;
                _.getApi();
              }
            });
      },
    );
  }

  Widget registerBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Register()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not A Member?',
            style: Palette.registerText1,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            'Register Here',
            style: Palette.registerText2,
          )
        ],
      ),
    );
  }

  Widget forgetPassword() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ForgotPassword());
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Forgot password?',
          style: Palette.forgetPassText,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }

  Widget socialMediaBtn() {
    UserLoginController getController = Get.find();
    UserResistorController _ = Get.put(UserResistorController());
    Future<void> _handleSignIn() async {
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await getController.googleSignIn.signIn();
        if (googleSignInAccount != null) {
          print(googleSignInAccount.displayName);
          print(googleSignInAccount.email);
          showSnackBar(
              title: "Success",
              color: Colors.green,
              isSuccess: true,
              message: "Successfully logedIn with google Signin");
        }
      } catch (error) {
        print(error);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        ),
      ],
    );
  }
}
