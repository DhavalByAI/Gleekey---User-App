import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:http/http.dart' as http;

import 'wishlistedProperties_model.dart';

class WishlistedPropertiesController extends GetxController {
  @override
  void onClose() {
    log("Wishlisted Properties page Closed");
    super.onClose();
  }

  WishlistedProperties_model? wishlistedProperties_model;

  var isDataLoaded = false;
  var wishlistedID = [];
  @override
  void onInit() {
    getApi();
    super.onInit();
  }

  getApi() async {
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.wishlist),
      headers: {
        'Authorization': 'Bearer ${currUser!.accessToken}',
      },
      body: {
        'offset': '0',
        'limit': '100',
      },
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      wishlistedProperties_model = WishlistedProperties_model.fromJson(result);
      isDataLoaded = true;
      log("WishlistedPropertiesController -- > got the data from API");
    } else {
      var result = json.decode(response.body);
      print(result);
      printError(
          info: "WishlistedPropertiesController -- > Not get data from api");
    }
    update();
  }
}
