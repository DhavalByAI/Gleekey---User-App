import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../Menu/DashBoard/dashBoard_model.dart';
import 'property_type_by_id_model.dart';

class PropertyTypeByIdController extends GetxController {
  late PropertyTypeById_model propertyTypeById_model;
  late PropertyType propertyType;
  List<Properties> properties = [];
  int offset = 0;
  int limit = 4;
  int loadLimit = 2;
  bool isExtraLoading = false;
  var id;
  bool isLast = false;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController controller = ScrollController();
  var isDataLoaded = false;

  // addItems() async {
  //   controller.addListener(() {
  //     if (controller.position.maxScrollExtent == controller.position.pixels) {
  //       for (int i = 0; i <= 0; i++) {
  //         isExtraLoading = true;
  //         update();
  //         limit = loadLimit;
  //         getApi(id, offset, limit);
  //       }
  //       update();
  //     }
  //   });
  // }

  getApi(int id, int pvtOffset, int pvtLimit) async {
    http.Response response = await http.post(
      Uri.parse(
          BaseConstant.BASE_URL + EndPoint.propertyTypeById + id.toString()),
      body: {'offset': pvtOffset.toString(), 'limit': pvtLimit.toString()},
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      propertyTypeById_model = PropertyTypeById_model.fromJson((result));
      propertyType = propertyTypeById_model.data!.propertyType!;
      if (propertyTypeById_model.data!.properties!.isNotEmpty &&
          !properties.contains(propertyTypeById_model.data!.properties![0])) {
        properties.addAll(propertyTypeById_model.data!.properties!);
        offset = pvtOffset + pvtLimit;
        isDataLoaded = true;
        log("Property Type By Id ($id) -- > $pvtOffset to $pvtLimit");
        isExtraLoading = false;
      } else {
        isLast = true;
      }
    } else {
      printError(info: "Property Type By Id ($id) -- > Not get data from api");
    }
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    update();
  }
}
