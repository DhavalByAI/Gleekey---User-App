import 'package:flutter/material.dart';
import 'package:gleekey_user/src/Auth/Ragistration/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_common.dart';
import '../../utils/style/constants.dart';
import '../../utils/style/palette.dart';
import '../../widgets/fade_slide_transition.dart';
import 'otp_screen.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin>
    with SingleTickerProviderStateMixin {
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            right: 27, left: 27, top: MediaQuery.of(context).size.height / 3.0),
        shape: Palette.businessCardShape,
        elevation: 6,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
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
                  controller: phoneController,
                  label: 'Phone Number',
                  hint: 'Enter Your Phone number',
                  validate: () {},
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              // FadeSlideTransition(
              //   animation: _formElementAnimation!,
              //   additionalOffset: space,
              //   child: otpBtn(),
              // ),
              // const SizedBox(
              //   height: 14,
              // ),
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
          ),
        ));
  }

  // Widget otpBtn() {
  //   return MaterialButton(
  //       shape: Palette.subCardShape,
  //       color: kOrange,
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         height: 45,
  //         child: Center(
  //           child: Text(
  //             'Login',
  //             style: Palette.btnText,
  //           ),
  //         ),
  //       ),
  //       onPressed: () async {
  //         // await FirebaseAuth.instance.verifyPhoneNumber(
  //         //   phoneNumber: '+91 7573063404',
  //         //   verificationCompleted: (PhoneAuthCredential credential) {},
  //         //   verificationFailed: (FirebaseAuthException e) {},
  //         //   codeSent: (String verificationId, int? resendToken) {},
  //         //   codeAutoRetrievalTimeout: (String verificationId) {},
  //         // );
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => const OtpScreen()));
  //       });
  // }

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

  Widget socialMediaBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/google_icon.png'))),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/facebook_icon.png'))),
        ),
      ],
    );
  }
}
