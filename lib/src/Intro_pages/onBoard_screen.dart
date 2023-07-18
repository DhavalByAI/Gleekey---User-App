import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Intro_pages/main_start_page.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:gleekey_user/widgets/commonText.dart';

import 'onBoard_controller.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardController _ = Get.put(OnBoardController());

    List<Widget> onBoardScreens = [
      onBoard1(),
      onBoard2(),
      onBoard3(),
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                controller: _.c,
                itemCount: onBoardScreens.length,
                itemBuilder: (context, i) {
                  return onBoardScreens[i];
                }),
            Column(
              children: [
                const Spacer(),
                Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            GetBuilder<OnBoardController>(
                              initState: (_) {},
                              builder: (_) {
                                return DotsIndicator(
                                  dotsCount: onBoardScreens.length,
                                  position: _.currIndex,
                                  decorator: const DotsDecorator(
                                    color: kLightGrey2,
                                    activeColor: kOrange,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: SizedBox(
                              height: 40,
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
                                    if (_.currIndex == 2) {
                                      Get.off(const MainStartPage());
                                    } else {
                                      _.currIndex++;
                                      _.update();
                                      _.c.animateToPage(_.currIndex.toInt(),
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.easeInQuad);
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            GestureDetector(
                              onTap: (() {
                                _.currIndex++;
                                // Get.off(MainStartPage());
                              }),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 200, top: 10),
                                child: commonText(
                                  text: "Skip >",
                                  color: kOrange,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget onBoard1() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Container(
        // color: AppColors.color1C2534,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/onBoard_bg.png",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  height: dheight * 0.4,
                  width: double.maxFinite,
                )),
            AnimatedPositioned(
                bottom: dheight * 0.3,
                duration: const Duration(milliseconds: 1000),
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
          ],
        ),
      ),
    );
  }

  Widget onBoard2() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Container(
        // color: AppColors.color1C2534,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "assets/images/onBoard_bg_180.png",
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              height: dheight * 0.4,
              width: double.maxFinite,
            ),
            AnimatedPositioned(
                top: dheight * 0.2,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  "assets/images/spalsh_2.png",
                  alignment: Alignment.topCenter,
                  height: 200,
                )),
            Column(
              children: [
                SizedBox(
                  height: dheight * 0.48,
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
          ],
        ),
      ),
    );
  }

  Widget onBoard3() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Container(
        // color: AppColors.color1C2534,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/onBoard_bg.png",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  height: dheight * 0.4,
                  width: double.maxFinite,
                )),
            AnimatedPositioned(
                bottom: dheight * 0.3,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  "assets/images/spalsh_3.png",
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
          ],
        ),
      ),
    );
  }
}
