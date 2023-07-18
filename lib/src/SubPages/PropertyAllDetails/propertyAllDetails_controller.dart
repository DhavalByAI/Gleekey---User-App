import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/PropertyAllDetails/propertyAllDetails_model.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PropertyAllDetailsController extends GetxController {
  @override
  void onClose() {
    isDataLoaded = false;
    super.onClose();
  }

  List? dateprice;
  String? startDate;
  String? endDate;
  int? totalPrice;
  PropertyAllDetails_model? propertyAllDetails_model;
  Data? PropertyData;
  bool isRulesExpanded = false;
  CarouselController carouselController = CarouselController();
  var isDataLoaded = false;
  List<SelectedDateWithPrice> selectedDateWithPrice = [];

  String getPriceFromDate(String date) {
    String price = '0';
    for (var element in dateprice ?? []) {
      element['date'].toString() == startDate
          ? price = element['original_price'].toString()
          : null;
    }
    return price;
  }

  List<String> getDatesBetween(
      {required String startDate, required String? endDate}) {
    List<String> dateList = [];

    if (endDate != null) {
      DateFormat formatter = DateFormat('dd-MM-yyyy');
      DateTime start = formatter.parse(startDate);
      DateTime end = formatter.parse(endDate);

      // Add the start date to the list
      dateList.add(formatter.format(start));

      // Generate the dates between the start and end dates (excluding the end date)
      while (start.isBefore(end)) {
        start = start.add(const Duration(days: 1));
        if (start.isBefore(end)) {
          dateList.add(formatter.format(start));
        }
      }
    } else {
      dateList.add(startDate);
    }

    return dateList;
  }

  priceUpdate() {
    totalPrice = null;
    selectedDateWithPrice = [];
    for (var element
        in getDatesBetween(startDate: startDate!, endDate: endDate)) {
      String price = getPriceFromDate(element);
      selectedDateWithPrice
          .add(SelectedDateWithPrice(date: element, price: price));
      totalPrice = int.parse(price) + int.parse((totalPrice ?? '0').toString());
    }
    update();
  }

  getApi(String slug, String id) async {
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.propertyAllDetails + slug),
    );
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      propertyAllDetails_model = PropertyAllDetails_model.fromJson(result);
      PropertyData = propertyAllDetails_model!.data;
      getPrice(
        params: {
          "property_id": id.toString(),
          "from_date":
              DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
          "to_date": DateFormat('dd-MM-yyyy')
              .format(DateTime.now().add(const Duration(days: 45)))
              .toString(),
        },
      );
      isDataLoaded = true;
      log("got the data -- > slug: $slug");
    } else {
      printError(
          info: "PropertyAllDetailsController --> Not get data from api");
    }
    update();
  }

  getPrice({
    required Map<String, dynamic> params,
    Function? success,
    Function? error,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            '${BaseConstant.BASE_URL}get_property_calender_price_user_side'),
        body: params,
        headers: {
          'Authorization': 'Bearer ${currUser!.accessToken}',
        },
      );
      print(response.body.toString());
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        if (result != null) {
          log(result.toString());
          if (result['status'] == true) {
            dateprice = (result['date'] ?? []);
            totalPrice = dateprice?[0]['original_price'];
            update();
            if (success != null) {
              success();
            }
            return true;
          } else {
            if (error != null) {
              error(result['message']);
            }
            return false;
          }
        } else {
          if (error != null) {
            error(result['message']);
          }
        }
      } else {
        if (error != null) {
          error(json.decode(response.body)['message']);
        }
        printError(
            info: "PropertyAllDetailsController --> Not get data from api");
      }
    } catch (e) {
      print('Something Went Wrong');
    }
    update();
  }
}

class SelectedDateWithPrice {
  String date;
  String price;
  SelectedDateWithPrice({required this.date, required this.price});
}
