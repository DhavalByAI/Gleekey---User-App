import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:http/http.dart' as http;

import 'receipt_model.dart';

class ReceiptController extends GetxController {
  Receipt_model? receipt_model;
  Booking? booking;
  var isDataLoaded = false;
  int tabCurrIndex = 0;
  getApi(String code) async {
    http.Response response = await http.get(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.receipt + code),
      headers: {
        'Authorization': 'Bearer ${currUser!.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      receipt_model = Receipt_model.fromJson(result);
      isDataLoaded = true;
      booking = receipt_model!.data!.booking;
      log("Receipt Controller -- > got the data from API");
    } else {
      printError(info: "Receipt Controller -- > Not get data from api");
    }
    update();
  }
}
