// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/widgets/showSnackBar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:http/http.dart' as http;

class FilterController extends GetxController {
  double currMinPrice = 0;
  double currMaxPrice = 5000;
  bool isDataLoaded = false;
  int totalAmenities = 6;
  var result;
  SfRangeValues values = const SfRangeValues(0, 5000);
  List<bool> islikebool = [];
  @override
  void onInit() {
    // DashBoardController _ = Get.find();
    // for (var type in _.propertyType) {
    //   PropertyTypeIcon.add(type.icon);
    //   PropertyTypeName.add(type.name);
    //   PropertyTypeID.add(type.id);
    // }
    // PropertyTypeID = _.propertyType;
    getApi();
    print(PropertyTypeName);
    super.onInit();
  }

  var PropertyTypeIcon = [];
  var PropertyTypeName = [];
  var PropertyTypeID = [];
  var filteredPropertyType = [];

  getApi() async {
    http.Response response = await http.post(
      Uri.tryParse("${BaseConstant.BASE_URL}${EndPoint.filter}")!,
    );
    if (response.statusCode == 200) {
      result = json.decode(response.body);
      isDataLoaded = true;
      islikebool = List.filled(result['data']['amenities'].length, false,
          growable: true);
      for (var x in result['data']['property_type_imgs']) {
        PropertyTypeName.add(x['name']);
        PropertyTypeIcon.add(x['icon']);
        PropertyTypeID.add(x['id']);
      }
      log("Filter Controller --> got data from api");
    } else {
      var result = json.decode(response.body);
      showSnackBar(title: "Try Again !", message: "Something Went Wrong");
      print(result);
      printError(info: "Filter Controller --> Not get data from api");
    }
    update();
  }
}
