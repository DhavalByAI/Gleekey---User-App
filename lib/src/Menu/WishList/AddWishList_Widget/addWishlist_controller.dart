import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:http/http.dart' as http;

import 'addWishlist_model.dart';

class WishlistController extends GetxController {
  Wishlist_model? wishlist_model;
  var isDataLoaded = false;
  var wishlistedID = [];

  getApi(int id) async {
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.addWishlist),
      headers: {
        'Authorization': 'Bearer ${currUser!.accessToken}',
      },
      body: {
        'property_id': id.toString(),
      },
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      wishlist_model = Wishlist_model.fromJson(result);
      // if (wishlist_model!.status) {
      //   wishlistedID.contains(id)
      //       ? wishlistedID.remove(id)
      //       : wishlistedID.add(id);
      // }
      isDataLoaded = true;
      log("AddWishList -- > got the data from API");
    } else {
      var result = json.decode(response.body);
      print(result);
      printError(info: "AddWishList -- > Not get data from api");
    }
    update();
  }
}
