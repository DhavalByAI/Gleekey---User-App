// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'text_styles.dart';

MaterialButton CommonButton(
    {String? name,
    TextStyle? style,
    double? radius,
    double? width,
    Color? color,
    Widget? child,
    required VoidCallback onPressed,
    EdgeInsetsGeometry? padding}) {
  return MaterialButton(
    color: color ?? AppColors.colorFE6927,
    minWidth: width,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 6)),
    onPressed: onPressed,
    padding: padding,
    child: child ??
        Text(
          name ?? '',
          style: style ?? colorfffffffs13w600,
        ),
  );
}

Container CommonBottomBar({required Widget child}) {
  return Container(
      height: 80,
      decoration: BoxDecoration(
          color: AppColors.colorffffff,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
      child: child);
}

StreamBuilder<bool> CommonCheckBox(RxBool rxValue) {
  return StreamBuilder(
      stream: rxValue.stream,
      builder: (context, snapshot) {
        return Checkbox(
          value: rxValue.value,
          onChanged: (val) {
            rxValue.value = !rxValue.value;
          },
          activeColor: AppColors.colorFE6927,
          side: BorderSide(
              color: AppColors.color000000.withOpacity(0.5), width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        );
      });
}
