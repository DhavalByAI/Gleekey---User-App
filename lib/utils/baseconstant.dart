import '../src/Auth/Login/userLogin_model.dart';

class BaseConstant {
  static const String BASE_URL = "https://gleekey.in/api/";
  static const String BASE_IMG_URL = "https://gleekey.in/public/images/";
  static const String BASE_PROPERTY_IMG_URL =
      "https://gleekey.in/public/images/property/";
  static const String BASE_PROPERTY_TYPE_IMG_URL =
      "https://gleekey.in/public/images/property_type/";
}

class EndPoint {
  static const String home = "home";
  static const String propertyTypeById = 'property-type/';
  static const String ragister = "register";
  static const String login = "login";
  static const String propertyAllDetails = "viewProperties/";
  static const String amenities = "amenitie/1/";
  static const String addWishlist = "addEditWishlist";
  static const String wishlist = "wishlist";
  static const String bookings = "trips/active";
  static const String receipt = "booking/receipt/";
  static const String forgetPassword = "forgot_password";
  static const String searchResult = "searchResult";
  static const String filter = "search";

  // static const String forgetPassword = "users/security";
}

const String googleMapsApi = "AIzaSyAsXCP8XNZCYRH6jcRQD1codAVPG8KJVs4";
User_model? currUser;
