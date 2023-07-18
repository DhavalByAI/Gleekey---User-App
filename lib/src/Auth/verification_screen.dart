import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/style/constants.dart';
import '../../utils/style/palette.dart';
import '../../widgets/fade_slide_transition.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController otpTextController = TextEditingController();

  String currentText = "";
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;

  AnimationController? _animationController;
  Animation<double>? _formElementAnimation;

  var space;

  @override
  void initState() {
    super.initState();

    errorController = StreamController<ErrorAnimationType>();

    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );
    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController!,
      curve: Interval(
        0.45,
        0.8,
        curve: Curves.easeInOut,
      ),
    ));
    _animationController!.forward();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: Text(
                  'verification',
                  style: Palette.loginText,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: Text(
                  'enter your verification code',
                  style: Palette.commonText1,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeSlideTransition(
                  animation: _formElementAnimation!,
                  additionalOffset: space,
                  child: otpScreen()),
              Text(
                'Resend code?',
                style: Palette.otpText14,
              ),
              SizedBox(
                height: 14,
              ),
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: otpBtn(),
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
          decoration: BoxDecoration(
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
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: kBlack.withOpacity(0.4),
          ),
        )
      ],
    );
  }

  Widget otpBtn() {
    return MaterialButton(
        shape: Palette.subCardShape,
        color: kOrange,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
            child: Text(
              'Verify code',
              style: Palette.btnText,
            ),
          ),
        ),
        onPressed: () {});
  }

  Widget otpScreen() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        cursorColor: kBlack,
        cursorHeight: 15,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: kLightGrey1.withOpacity(0.1),
          inactiveColor: kLightGrey1.withOpacity(0.1),
          inactiveFillColor: kLightGrey1.withOpacity(0.1),
          activeColor: kLightGrey1.withOpacity(0.1),
          selectedFillColor: kLightGrey1.withOpacity(0.1),
          borderWidth: 0,
          disabledColor: kLightGrey1.withOpacity(0.1),
        ),
        animationDuration: Duration(milliseconds: 300),
        // backgroundColor: Colors.blue.shade50,
        enableActiveFill: true,
        errorAnimationController: errorController,
        textStyle: Palette.blackText16,
        controller: otpTextController,

        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          print(value);
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
        appContext: context,
      ),
    );
  }
}
