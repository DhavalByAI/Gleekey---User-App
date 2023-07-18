import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_view.dart';
import 'package:gleekey_user/src/HomePage/homePage_view.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_controller.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_view.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashboard_controller.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashboard_view.dart';
import 'package:gleekey_user/src/Menu/WishList/AddWishList_Widget/addWishlist_controller.dart';
import 'package:gleekey_user/src/Menu/WishList/wishlistedProperties_controller.dart';
import 'package:gleekey_user/src/Menu/WishList/wishlistedProperties_view.dart';
import 'package:gleekey_user/src/SubPages/notification.dart';

class HomePageController extends GetxController {
  PageController pageController = PageController(keepPage: false);
  int? currentIndex = 0;

  List<Widget> mainPages = [
    const DashBoard(),
    const WishlistedProperties(),
    const Bookings(),
    const Notifications(),
  ];

  @override
  void onInit() {
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt();
    });
    super.onInit();
  }

  pageChange() {
    Get.delete<BookingsController>();
    Get.delete<WishlistedPropertiesController>();
    Get.delete<DashBoardController>();
  }

  void goto(int i) {
    UserLoginController _ = Get.find();
    if (i > 0 && !_.isUserLogedIn) {
      pageChange();
      currentIndex = 0;
      i = 0;
      update();
      Get.off(() => const Login());
    }

    switch (i) {
      case 0:
        pageChange();
        Get.put(HomePageController());

        pageController.jumpToPage(i);
        currentIndex = i;
        break;
      case 1:
        pageChange();
        Get.put(WishlistedPropertiesController());
        Get.put(WishlistController());
        pageController.jumpToPage(i);
        currentIndex = i;
        break;
      case 2:
        pageChange();
        Get.put(BookingsController());
        pageController.jumpToPage(i);
        currentIndex = i;
        break;
      case 3:
        pageChange();
        pageController.jumpToPage(i);
        currentIndex = i;
        break;
      case 4:
        drawerKey.currentState?.openDrawer();
        break;
    }

    update();
  }
}
