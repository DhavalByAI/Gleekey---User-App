import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_view.dart';
import 'package:gleekey_user/src/Auth/Ragistration/userRegister_controller.dart';
import 'package:gleekey_user/widgets/loder.dart';

import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_common.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_password.dart';

import '../../../utils/style/constants.dart';
import '../../../utils/style/palette.dart';
import 'package:intl/intl.dart';
import '../../../widgets/fade_slide_transition.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _formElementAnimation;

  bool obsecure1 = true;
  bool obsecure2 = true;
  final UserResistorController _ = Get.put(UserResistorController());
  var space;

  @override
  void initState() {
    super.initState();
    _.firstNameController = TextEditingController();
    _.lastNameController = TextEditingController();
    _.emailController = TextEditingController();
    _.phoneController = TextEditingController();
    _.passwordController = TextEditingController();
    _.confirmPasswordController = TextEditingController();
    _.birthDateController = TextEditingController();
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
            right: 27, left: 27, top: MediaQuery.of(context).size.height / 15),
        shape: Palette.businessCardShape,
        elevation: 6,
        child: Container(
            // height: 380,
            padding: const EdgeInsets.all(20),
            child: GetBuilder<UserResistorController>(
              initState: (_) {},
              builder: (_) {
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
                                image:
                                    AssetImage('assets/images/app_logo.png'))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeSlideTransition(
                      animation: _formElementAnimation!,
                      additionalOffset: space,
                      child: CustomTextfieldCommon(
                        controller: _.firstNameController,
                        label: 'First Name',
                        hint: 'Enter your name',
                        errorText: _.firstNameError,
                        validate: _.validate,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeSlideTransition(
                      animation: _formElementAnimation!,
                      additionalOffset: space,
                      child: CustomTextfieldCommon(
                        controller: _.lastNameController,
                        label: 'Last Name',
                        hint: 'Enter your name',
                        validate: _.validate,
                        errorText: _.lastNameError,
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
                        label: 'Email',
                        validate: _.validate,
                        hint: 'Enter your Email',
                        errorText: _.emailError,
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeSlideTransition(
                      animation: _formElementAnimation!,
                      additionalOffset: space,
                      child: CustomTextfieldCommon(
                        controller: _.phoneController,
                        label: 'Phone Number',
                        validate: _.validate,
                        textInputFormatter: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        hint: 'Enter your Phone Number',
                        textInputType: TextInputType.phone,
                        errorText: _.phoneError,
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
                        errorText: _.passwordError,
                        validate: _.validate,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeSlideTransition(
                      animation: _formElementAnimation!,
                      additionalOffset: space,
                      child: CustomTextfieldPass(
                        controller: _.confirmPasswordController,
                        label: 'Confirm Password',
                        hint: 'Confirm Password',
                        errorText: _.cnfmPasswordError,
                        validate: _.validate,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<UserResistorController>(
                      initState: (_) {},
                      builder: (_) {
                        return FadeSlideTransition(
                            animation: _formElementAnimation!,
                            additionalOffset: space,
                            child: CustomTextfieldCommon(
                              onTap: () async {
                                _.birthDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2000, 01, 01),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: kOrange,
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: kOrange,
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (_.birthDate != null) {
                                  print(_.birthDate);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(_.birthDate!);
                                  print(formattedDate);
                                  _.birthDateController.text = formattedDate;
                                  _.update();
                                }
                              },
                              btnValidate: true,
                              label: 'Birth Date',
                              validate: _.validate,
                              hint: 'Enter your Birthdate',
                              textInputType: TextInputType.phone,
                              errorText: _.birthDateError,
                              controller: _.birthDateController,
                            ));
                      },
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
                      height: 14,
                    ),
                    FadeSlideTransition(
                      animation: _formElementAnimation!,
                      additionalOffset: space,
                      child: loginBtn(),
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
                            'or register with',
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
              },
            )));
  }

  Widget registerBtn() {
    return GetBuilder<UserResistorController>(
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
                  'Sign Up',
                  style: Palette.btnText,
                ),
              ),
            ),
            onPressed: () async {
              _.isValidate = true;
              _.validate();
              if (_.emailError == null &&
                  _.firstNameError == null &&
                  _.lastNameError == null &&
                  _.phoneError == null &&
                  _.passwordError == null &&
                  _.cnfmPasswordError == null &&
                  _.birthDateError == null) {
                loaderShow(context);
                await _.getApi();
              }
            });
      },
    );
  }

  Widget loginBtn() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const Login());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: Palette.registerText1,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            'Login',
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
        const SizedBox(
          width: 30,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/phone_icon.png'))),
        ),
      ],
    );
  }
}
