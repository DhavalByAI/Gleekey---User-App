import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_model.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:http/http.dart' as http;

class BookingsController extends GetxController {
  // Bookings_model? bookings_model;
  var isDataLoaded = false;
  int tabCurrIndex = 0;
  var completedBookings = [];
  var onGoingBookings = [];
  var canceledBookings = [];
  var allBookings = [];
  var upcomingBookings = [];
  var expiredBookings = [];
  var tripData;
  @override
  void onInit() {
    getApi();
    super.onInit();
  }

  getApi() async {
    http.Response response = await http.post(
      Uri.parse(BaseConstant.BASE_URL + EndPoint.bookings),
      headers: {
        'Authorization': 'Bearer ${currUser!.accessToken}',
      },
      body: {
        'offset': '0',
        'limit': '10000',
      },
    );
    if (response.statusCode == 200) {
      tripData = json.decode(response.body);
      // bookings_model = Bookings_model.fromJson(result);
      isDataLoaded = true;
      allBookings.addAll(tripData['data']['bookings']);
      expiredBookings.addAll(tripData['data']['expired_bookings']);
      // onGoingBookings.addAll(bookings_model!.data!.currentBookings!);
      // completedBookings.addAll(bookings_model!.data!.completedBookings!);
      // canceledBookings.addAll(bookings_model!.data!.expiredBookings!);
      log("Bookings Controller -- > got the data from API");
    } else {
      printError(info: "Bookings Controller -- > Not get data from api");
    }
    update();
  }
}
