import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:gleekey_user/widgets/loder.dart';

import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_common.dart';

import '../../utils/style/constants.dart';
import '../../utils/style/palette.dart';

import '../../widgets/fade_slide_transition.dart';
import 'verification_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();

  AnimationController? _animationController;
  Animation<double>? _formElementAnimation;

  late var space;

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
                child: mainView()),
          ],
        ),
      ),
    );
  }

  Widget mainView() {
    return Card(
        margin: EdgeInsets.only(
            right: 27, left: 27, top: MediaQuery.of(context).size.height / 2.2),
        shape: Palette.businessCardShape,
        elevation: 6,
        child: Container(
          // height: 380,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: Text(
                  'Forgot Password?',
                  style: Palette.loginText,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: Text(
                  'don’t worry,we can help',
                  style: Palette.commonText1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<UserLoginController>(
                initState: (_) {},
                builder: (_) {
                  return FadeSlideTransition(
                    animation: _formElementAnimation!,
                    additionalOffset: space,
                    child: CustomTextfieldCommon(
                      controller: _.ForgetemailController,
                      label: 'Email',
                      hint: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validate: _.ForgetPasswordvalidate,
                      errorText: _.forgetPasswordEmailError,
                      btnValidate: _.isForgetPasswordValidate,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: sendBtn(),
              ),
            ],
          ),
        ));
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

  Widget sendBtn() {
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
                  'Send',
                  style: Palette.btnText,
                ),
              ),
            ),
            onPressed: () {
              _.isForgetPasswordValidate = true;
              _.update();
              _.ForgetPasswordvalidate();
              if (_.forgetPasswordEmailError == null) {
                loaderShow(context);
                _.forgetPasswordEmail = _.ForgetemailController.text;
                _.forgetPasswordApi();
              }
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const VerificationScreen()));
            });
      },
    );
  }
}
