import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardController extends GetxController {
  double currIndex = 0;
  PageController c = PageController(initialPage: 0);
  @override
  void onInit() {
    c.addListener(() {
      currIndex = c.page!;
      print(c.page);
      update();
    });
    super.onInit();
  }
}
