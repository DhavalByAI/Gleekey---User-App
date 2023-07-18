import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashBoard_model.dart';
import 'package:gleekey_user/src/Menu/WishList/wishlistedProperties_controller.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class DashBoardController extends GetxController {
  UserLoginController getController = Get.find();

  double currDotValue = 0;
  double? currLatitude;
  double? currLongitude;

  @override
  void onClose() {
    log("Dashboard closed");
    super.onClose();
  }

  late DashBoard_model dashBoard_model;
  List<StartingCities> startingCities = [];
  List<PropertyType> propertyType = [];

  List<Properties> properties = [];
  var isDataLoaded = false;

  @override
  void onInit() async {
    isDataLoaded = false;
    Get.put(WishlistedPropertiesController());
    await getApi();
    await getLocation();
    super.onInit();
  }

  getLocation() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        Location location = Location();
        LocationData currLocation = await location.getLocation();
        currLatitude = 21.1637618;
        currLongitude = 72.8160861;
        // currLatitude = currLocation.latitude;
        // currLongitude = currLocation.longitude;
        getApi();
        update();
      } else if (status.isDenied) {
        await [Permission.location].request();
        var status = await Permission.location.status;
        status.isGranted ? getLocation() : null;
        // print(
        //     "status:${status['Permission.location'] == PermissionStatus.granted}");
        // status. ? getLocation() : null;
      } else if (status.isPermanentlyDenied) {
        // openAppSettings();
      }
    } else {}
    update();
  }

  getApi() async {
    print("userID : ${currUser?.data?.id}");
    http.Response response = await http.post(
        Uri.tryParse("${BaseConstant.BASE_URL}${EndPoint.home}")!,
        // /${currUser!.data!.id}
        body: {
          'curr_lat': currLatitude.toString(),
          'curr_lng': currLongitude.toString()
        });

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      dashBoard_model = DashBoard_model.fromJson((result));
      startingCities = dashBoard_model.data!.startingCities!;
      propertyType = dashBoard_model.data!.propertyType!;
      properties = dashBoard_model.data!.properties ?? [];
      // var pages = properties.length ~/ 4;
      // properties.length.remainder(4) > 0 ? pages++ : null;
      isDataLoaded = true;
      log("Dashboard Controller --> got data from api");
    } else {
      var result = json.decode(response.body);
      print(result);
      printError(info: "Dashboard Controller --> Not get data from api");
    }
    // print("here" + properties.length.toString());
    update();
  }
}
