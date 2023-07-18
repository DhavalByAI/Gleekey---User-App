import 'package:get/get.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  Object? params;
  // getApi() async {
  //   http.Response response = await http.post(
  //     Uri.parse(BaseConstant.BASE_URL + EndPoint.searchResult),
  //     headers: {
  //       'Authorization': 'Bearer ${currUser!.accessToken}',
  //     },
  //     body: {
  //       'location': selectedPlace.toString(),
  //       'min_price': _.currMinPrice.toString(),
  //       'max_price': _.currMaxPrice.toString(),
  //       'amenities': '',
  //       'property_type': '',
  //       'guest': totalAdults.toString(),
  //       'page': '1',
  //       'limit': '1000',
  //       'currency_code': 'INR'
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var result = json.decode(response.body);
  //     // print(result);
  //     isDataLoaded = true;
  //     properties = [];

  //     for (var x in result['data']) {
  //       properties.add(Properties.fromJson(x));
  //     }
  //     print("pr:${properties.length}");
  //     isSucsess = true;
  //     update();
  //     if (isSucsess) {
  //       print("object");
  //       Get.back();
  //       Get.to(() => PropertyList(
  //           properties: properties, lat: result['lat'], long: result['long']));
  //       loaderHide();
  //     }
  //     log("SearchPlacesController -- > got the data from API");
  //   } else {
  //     var result = json.decode(response.body);
  //     print(result);
  //     showSnackBar(title: "Try Again!", message: "Something Went Wrong");
  //     printError(info: "SearchPlacesController -- > Not get data from api");
  //     loaderHide();
  //   }
  //   update();
  // }
}
