import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Intro_pages/main_start_page.dart';
import 'package:gleekey_user/src/Intro_pages/onBoard_controller.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../utils/style/palette.dart';

class onBoard extends StatelessWidget {
  const onBoard({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardController _ = Get.put(OnBoardController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: kWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/onBoard_bg.png",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.maxFinite,
                )),
            AnimatedPositioned(
                bottom: MediaQuery.of(context).size.height * 0.3,
                duration: Duration(milliseconds: 1000),
                child: Image.asset(
                  "assets/images/spash_1.png",
                  alignment: Alignment.topCenter,
                  height: 200,
                )),
            Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                commonText(
                  text: "Find Your\nFavourite Hotel\nTo Stay",
                  color: kBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  child: commonText(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    color: kBlack.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.08,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    DotsIndicator(
                      dotsCount: 3,
                      position: 0,
                      decorator: const DotsDecorator(
                        color: kLightGrey2,
                        activeColor: kOrange,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: 45,
                            width: 100,
                            child: MaterialButton(
                                color: kOrange,
                                shape: Palette.subCardShape,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 7, 10, 7),
                                child: commonText(
                                  text: 'NEXT',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: kWhite,
                                ),
                                onPressed: () {
                                  // Get.off(MainStartPage());
                                }),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Flexible(
                          flex: 2,
                          child: GestureDetector(
                            onTap: (() {
                              _.currIndex++;
                              Get.off(MainStartPage());
                            }),
                            child: commonText(
                              text: "Skip >",
                              color: kOrange,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
