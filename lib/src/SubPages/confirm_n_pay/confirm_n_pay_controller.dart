import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/utils/baseconstant.dart';

class ConfrimNPayController extends GetxController {
  bool isPriceBreakup = false;
  TextEditingController promoCode = TextEditingController();
  TextEditingController firstName =
      TextEditingController(text: currUser!.data!.firstName);
  TextEditingController lastName =
      TextEditingController(text: currUser!.data!.lastName);
  TextEditingController email =
      TextEditingController(text: currUser!.data!.email);
  TextEditingController mobile =
      TextEditingController(text: currUser!.data!.phone);
  TextEditingController request = TextEditingController();
  double selectedRadioButton = 0;
  double selectedRadioButton1 = 0;
}
