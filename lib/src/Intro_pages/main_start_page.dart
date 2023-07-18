import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_view.dart';
import 'package:gleekey_user/src/Auth/Ragistration/register.dart';
import 'package:gleekey_user/src/HomePage/homePage_view.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../widgets/fade_slide_transition.dart';

class MainStartPage extends StatefulWidget {
  const MainStartPage({Key? key}) : super(key: key);

  @override
  State<MainStartPage> createState() => _MainStartPageState();
}

class _MainStartPageState extends State<MainStartPage>
    with SingleTickerProviderStateMixin {
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
      body: Stack(
        children: [backGroudImage(), start()],
      ),
    );
  }

  Widget backGroudImage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/on_boarding_image.png'),
              fit: BoxFit.fill)),
    );
  }

  Widget start() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: 178,
          decoration: BoxDecoration(
            color: kBlack,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.08), kBlack],
            ),
          ),
          child: Column(
            children: [
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and type.',
                  style: Palette.onboardingText,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: MaterialButton(
                    color: kOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      'START',
                      style: Palette.onboardingText1,
                    ),
                    onPressed: () {
                      final box = Hive.box('gleekey');
                      box.put('isEverLogedin', "true");
                      Get.to(() => HomePage());
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeSlideTransition(
                animation: _formElementAnimation!,
                additionalOffset: space,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: Text(
                      'don’t have account?',
                      style: Palette.onboardingText2,
                    )),
              ),
            ],
          )),
    );
  }
}
