// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';

AppBar AppBarWithTitleAndBack({required String title, bool backButton = true}) {
  return AppBar(
    elevation: 0,
    leading: backButton
        ? Bounce(
            duration: const Duration(milliseconds: 150),
            onPressed: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: kBlack,
            ),
          )
        : null,
    backgroundColor: kWhite,
    title: Text(
      title,
      style: Palette.headerText,
    ),
    centerTitle: true,
  );
}
