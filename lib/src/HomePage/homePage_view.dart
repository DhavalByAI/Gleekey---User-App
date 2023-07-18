import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/HomePage/widgets/get_help/get_help_screen.dart';
import 'package:gleekey_user/src/SubPages/Payment%20Methods/paymentMethod_view.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashboard_controller.dart';
import 'package:gleekey_user/src/Auth/profile/profile.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:gleekey_user/widgets/drawer_tile.dart';
import 'package:gleekey_user/widgets/exitPoopUp.dart';
import 'HomePage_controller.dart';
import 'package:url_launcher/url_launcher.dart';

GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomePageController getController = Get.put(HomePageController());
    Get.put(DashBoardController());
    var tileName = [
      // "become a pro member",
      "become a host",
      "become an agent",
      "wishlist",
      // "notification",
      "my bookings",
      "payment method",
      // "support",
      "help"
    ];

    // becomeAproMember() {}

    becomeAhost() {
      Get.back();
      launchUrl(
        Uri.parse(
            'https://play.google.com/store/apps/details?id=com.softieons.gleekyhost'),
        mode: LaunchMode.externalApplication,
      );
      // Get.to(() => const BecomeAHost());
    }

    becomeAagent() {
      Get.back();
      launchUrl(
        Uri.parse(
            'https://play.google.com/store/apps/details?id=com.softieons.gleekyhost'),
        mode: LaunchMode.externalApplication,
      );
      // Get.to(() => const BecomeAnAgentWebView());
    }

    wishlist() {
      Get.back();
      getController.goto(1);
    }

    // notification() {
    //   Get.back();
    //   getController.goto(3);
    // }

    myBookings() {
      Get.back();
      getController.goto(2);
    }

    paymentMethod() {
      Get.back();
      Get.to(() => const PaymentMethod());
    }

    // support() {
    //   Get.back();
    //   Get.to(() => SupportScreen());
    // }

    help() {
      Get.back();
      Get.to(() => const GetHelpScreen());
    }

    var tileFunction = [
      // becomeAproMember,
      becomeAhost,
      becomeAagent,
      wishlist,
      // notification,
      myBookings,
      paymentMethod,
      // support,
      help
    ];

    int? lastIndex;
    return WillPopScope(
      onWillPop: () {
        return showExitPopup(context);
      },
      child: Scaffold(
          key: drawerKey,
          onDrawerChanged: (isOpened) {
            if (isOpened) {
              lastIndex = getController.currentIndex;
              getController.currentIndex = 4;
              getController.update();
            } else {
              getController.currentIndex = lastIndex;
              getController.update();
            }
          },
          body: GetBuilder<HomePageController>(
            initState: (_) {},
            builder: (_) {
              return PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _.mainPages.length,
                  controller: _.pageController,
                  itemBuilder: ((context, index) {
                    return _.mainPages[index];
                  }));
            },
          ),
          drawerEnableOpenDragGesture: true,
          drawer: GetBuilder<UserLoginController>(
              initState: (_) {},
              builder: (_) {
                return Drawer(
                  backgroundColor: kDrawer,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            "assets/images/appbar_icons/appbar_blob.png",
                            height: dheight.toDouble(),
                          )),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                            "assets/images/appbar_icons/appbar_hotel.png",
                            height: dheight * 0.2,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          top: 40,
                        ),
                        child: Column(
                          children: [
                            Bounce(
                              duration: const Duration(milliseconds: 150),
                              onPressed: () {
                                Get.to(() => ProfileScreen());
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 52 / 2,
                                    backgroundImage: NetworkImage(
                                        currUser!.data!.profileSrc),
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        commonText(
                                          text: currUser!.data!.firstName +
                                              " " +
                                              currUser!.data!.lastName,
                                          color: kWhite,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        commonText(
                                          text: currUser!.data!.email,
                                          color: kWhite,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                            SizedBox(
                              height: dheight * 0.7,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              height: 28,
                                            );
                                          },
                                          shrinkWrap: true,
                                          itemCount: tileName.length,
                                          itemBuilder: ((context, index) {
                                            return DrawerTile(
                                                tileIcon: tileName[index],
                                                tileName: tileName[index],
                                                tileFunction:
                                                    tileFunction[index]);
                                          })),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Bounce(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        onPressed: (() {
                                          BtmLogout(context);
                                        }),
                                        child: Container(
                                          height: 45,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: kWhite,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/logout_icon.png",
                                                height: 25,
                                                width: 25,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              commonText(
                                                text: "Logout",
                                                color: kBlack,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
          bottomNavigationBar: GetBuilder<HomePageController>(
            initState: (_) {},
            builder: (_) {
              return Container(
                height: 80,
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: kDarkGrey.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0.0, 5.0))
                    ]),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (() {
                          _.goto(0);
                        }),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: _.currentIndex == 0
                                      ? Image.asset(
                                          "assets/images/home_icon_color.png",
                                          scale: 6,
                                          color: kOrange,
                                          width: 23,
                                          height: 23,
                                        )
                                      : Image.asset(
                                          "assets/images/home_icon.png",
                                          scale: 6,
                                          color: kBlack.withOpacity(0.3),
                                          width: 23,
                                          height: 23,
                                        )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Home',
                                style: _.currentIndex == 0
                                    ? Palette.bottomTextDark
                                    : Palette.bottomTextLight,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          _.goto(1);
                        }),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: _.currentIndex == 1
                                      ? Image.asset(
                                          "assets/images/wishlist_icon_color.png",
                                          scale: 6,
                                          color: kOrange,
                                          width: 23,
                                          height: 23,
                                        )
                                      : Image.asset(
                                          "assets/images/wishlist_icon.png",
                                          scale: 6,
                                          color: kBlack.withOpacity(0.3),
                                          width: 23,
                                          height: 23,
                                        )),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Wishlist',
                                style: _.currentIndex == 1
                                    ? Palette.bottomTextDark
                                    : Palette.bottomTextLight,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _.goto(2);
                        },
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: _.currentIndex == 2
                                      ? Image.asset(
                                          "assets/images/booking_icon_color.png",
                                          scale: 6,
                                          color: kOrange,
                                          width: 23,
                                          height: 23,
                                        )
                                      : Image.asset(
                                          "assets/images/booking_icon.png",
                                          scale: 6,
                                          color: kBlack.withOpacity(0.3),
                                          width: 23,
                                          height: 23,
                                        )),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Booking',
                                style: _.currentIndex == 2
                                    ? Palette.bottomTextDark
                                    : Palette.bottomTextLight,
                              )
                            ],
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     _.goto(3);
                      //   },
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       AnimatedContainer(
                      //           duration: const Duration(milliseconds: 1500),
                      //           curve: Curves.fastLinearToSlowEaseIn,
                      //           child: _.currentIndex == 3
                      //               ? Image.asset(
                      //                   "assets/images/bell_icon_color.png",
                      //                   scale: 6,
                      //                   color: kOrange,
                      //                   width: 23,
                      //                   height: 23,
                      //                 )
                      //               : Image.asset(
                      //                   "assets/images/bell_icon.png",
                      //                   scale: 6,
                      //                   color: kBlack.withOpacity(0.3),
                      //                   width: 23,
                      //                   height: 23,
                      //                 )),
                      //       const SizedBox(
                      //         height: 5,
                      //       ),
                      //       Text(
                      //         'Notification',
                      //         style: _.currentIndex == 3
                      //             ? Palette.bottomTextDark
                      //             : Palette.bottomTextLight,
                      //       )
                      //     ],
                      //   ),
                      // ),

                      InkWell(
                          onTap: () {
                            _.goto(4);
                          },
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: _.currentIndex == 4
                                        ? Image.asset(
                                            "assets/images/profile_icon_color.png",
                                            scale: 6,
                                            color: kOrange,
                                            width: 23,
                                            height: 23,
                                          )
                                        : Image.asset(
                                            "assets/images/profile_icon.png",
                                            scale: 6,
                                            color: kBlack.withOpacity(0.3),
                                            width: 23,
                                            height: 23,
                                          )),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Profile',
                                  style: _.currentIndex == 4
                                      ? Palette.bottomTextDark
                                      : Palette.bottomTextLight,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

Future<dynamic> BtmLogout(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      context: context,
      builder: ((context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    height: 4,
                    width: 40,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  commonText(
                    color: kBlack,
                    fontSize: 20,
                    text: "Log Out?",
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: commonText(
                      textAlign: TextAlign.center,
                      color: kBlack.withAlpha(125),
                      fontSize: 15,
                      text: "Are You Sure, You Wants To Logout?",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Bounce(
                            duration: const Duration(milliseconds: 300),
                            onPressed: (() {
                              Get.back();
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kBtnGrey,
                                  borderRadius: BorderRadius.circular(6)),
                              height: 45,
                              child: Center(
                                child: commonText(
                                  textAlign: TextAlign.center,
                                  color: kBlack,
                                  fontSize: 14,
                                  text: "Cancel",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 300),
                            onPressed: () {
                              UserLoginController _ = Get.find();
                              _.logOut();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kOrange),
                                  color: kOrange,
                                  borderRadius: BorderRadius.circular(6)),
                              height: 45,
                              child: Center(
                                child: commonText(
                                  textAlign: TextAlign.center,
                                  color: kWhite,
                                  fontSize: 14,
                                  text: "Logout",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}
