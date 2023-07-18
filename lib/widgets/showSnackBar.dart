import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

showSnackBar(
    {required String title,
    required String message,
    Color color = Colors.red,
    bool isSuccess = false}) {
  return Get.snackbar(
    title, // title
    message, // message
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    backgroundColor: color,
    colorText: Colors.white,
    icon: Icon(
      isSuccess ? Icons.check_circle : Icons.error,
      color: Colors.white,
    ),
    onTap: (_) {},
    shouldIconPulse: true,
    barBlur: 10,
    isDismissible: true,
    duration: const Duration(seconds: 2),
  );
}
