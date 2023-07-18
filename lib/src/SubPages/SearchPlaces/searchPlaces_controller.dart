import 'dart:convert';
import 'dart:developer';
import 'package:gleekey_user/src/SubPages/Filter/filter_controller.dart';

import 'package:gleekey_user/src/Menu/DashBoard/dashBoard_model.dart';
import 'package:gleekey_user/src/SubPages/list_view.dart';
import 'package:gleekey_user/widgets/loder.dart';

import 'package:gleekey_user/widgets/showSnackBar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashboard_controller.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchPlacesController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  TextEditingController gleekeySearchController = TextEditingController();
  List<Properties> properties = [];
  String sessionToken = "";
  var pridiction = [];
  var selectedPlace = "Search Places";

  bool isSucsess = false;
  String? startDate, endDate;
  bool isDataLoaded = false;
  int totalAdults = 1;
  int totalChildren = 0;
  int totalInphant = 0;
  int? totalNight;

  @override
  void onInit() {
    sessionToken = const Uuid().v4();
    searchTextController.addListener(() {
      getSuggestion(searchTextController.text);
    });
    super.onInit();
  }

  getSuggestion(String input) async {
    DashBoardController _ = Get.find();
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$googleMapsApi&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      pridiction = result['predictions'];
      result['predictions'].isEmpty
          ? _.startingCities.forEach((city) {
              pridiction.add({"description": city.name});
            })
          : null;
      log("Search places Controller -- > got the data from API");
    } else {
      printError(info: "Search places Controller -- > Not get data from api");
    }
    update();
  }

  getApi() async {
    isSucsess = false;
    FilterController _ = Get.find();
    // print(totalAdults.toString());
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.searchResult),
      headers: {
        'Authorization': 'Bearer ${currUser!.accessToken}',
      },
      body: {
        'location': selectedPlace.toString(),
        'min_price': _.currMinPrice.toString(),
        'max_price': _.currMaxPrice.toString(),
        'amenities': '',
        'property_type': '',
        'guest': totalAdults.toString(),
        'page': '1',
        'limit': '1000',
        'currency_code': 'INR'
      },
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      // print(result);
      isDataLoaded = true;
      properties = [];

      for (var x in result['data']) {
        properties.add(Properties.fromJson(x));
      }
      print("pr:${properties.length}");
      isSucsess = true;
      update();
      if (isSucsess) {
        print("object");
        Get.back();
        Get.to(() => PropertyList(
            properties: properties, lat: result['lat'], long: result['long']));
        loaderHide();
      }
      log("SearchPlacesController -- > got the data from API");
    } else {
      var result = json.decode(response.body);
      print(result);
      showSnackBar(title: "Try Again!", message: "Something Went Wrong");
      printError(info: "SearchPlacesController -- > Not get data from api");
      loaderHide();
    }
    update();
  }

  void priceUpdate(
      {var startD, var endD, var adults, var children, var inphant}) {
    if (startDate != null && endDate != null) {
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime sDate = dateFormat.parse(startDate!);
      DateTime eDate = dateFormat.parse(endDate!);
      Duration duration = eDate.difference(sDate);
      totalNight = (duration.inMilliseconds / 86400000).ceil() == 0
          ? null
          : (duration.inMilliseconds / 86400000).ceil();
    } else {
      totalNight = null;
    }
  }
}
