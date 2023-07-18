import 'package:gleekey_user/src/Menu/DashBoard/dashBoard_model.dart';

class Bookings_model {
  bool? status;
  var message;
  Data? data;

  Bookings_model({this.status, this.message, this.data});

  Bookings_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  var yesterday;
  var status;
  List<BookedProperties>? bookings;
  List<BookedProperties>? expiredBookings;
  List<BookedProperties>? currentBookings;
  List<BookedProperties>? upcomingBookings;
  List<BookedProperties>? completedBookings;
  List<BookedProperties>? pendingBookings;

  Data(
      {this.yesterday,
      this.status,
      this.bookings,
      this.expiredBookings,
      this.currentBookings,
      this.upcomingBookings,
      this.completedBookings,
      this.pendingBookings});

  Data.fromJson(Map<String, dynamic> json) {
    yesterday = json['yesterday'];
    status = json['status'];
    if (json['bookings'] != null) {
      bookings = <BookedProperties>[];
      json['bookings'].forEach((v) {
        bookings!.add(BookedProperties.fromJson(v));
      });
    }
    if (json['expired_bookings'] != null) {
      expiredBookings = <BookedProperties>[];
      json['expired_bookings'].forEach((v) {
        expiredBookings!.add(BookedProperties.fromJson(v));
      });
    }
    if (json['current_bookings'] != null) {
      currentBookings = <BookedProperties>[];
      json['current_bookings'].forEach((v) {
        currentBookings!.add(BookedProperties.fromJson(v));
      });
    }
    if (json['upcoming_bookings'] != null) {
      upcomingBookings = <BookedProperties>[];
      json['upcoming_bookings'].forEach((v) {
        upcomingBookings!.add(BookedProperties.fromJson(v));
      });
    }
    if (json['completed_bookings'] != null) {
      completedBookings = <BookedProperties>[];
      json['completed_bookings'].forEach((v) {
        completedBookings!.add(BookedProperties.fromJson(v));
      });
    }
    if (json['pending_bookings'] != null) {
      pendingBookings = <BookedProperties>[];
      json['pending_bookings'].forEach((v) {
        pendingBookings!.add(BookedProperties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yesterday'] = this.yesterday;
    data['status'] = this.status;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    if (this.expiredBookings != null) {
      data['expired_bookings'] =
          this.expiredBookings!.map((v) => v.toJson()).toList();
    }
    if (this.currentBookings != null) {
      data['current_bookings'] =
          this.currentBookings!.map((v) => v.toJson()).toList();
    }
    if (this.upcomingBookings != null) {
      data['upcoming_bookings'] =
          this.upcomingBookings!.map((v) => v.toJson()).toList();
    }
    if (this.completedBookings != null) {
      data['completed_bookings'] =
          this.completedBookings!.map((v) => v.toJson()).toList();
    }
    if (this.pendingBookings != null) {
      data['pending_bookings'] =
          this.pendingBookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookedProperties {
  var id;
  var propertyId;
  var code;
  var hostId;
  var userId;
  var startDate;
  var endDate;
  var status;
  var guest;
  var totalNight;
  var perNight;
  var customPriceDates;
  var basePrice;
  var cleaningCharge;
  var guestCharge;
  var serviceCharge;
  var securityMoney;
  var ivaTax;
  var accomodationTax;
  var dateWithPrice;
  var hostFee;
  var total;
  var bookingType;
  var currencyCode;
  var cancellation;
  var transactionId;
  var paymentMethodId;
  var acceptedAt;
  var attachment;
  var bankId;
  var note;
  var expiredAt;
  var declinedAt;
  var cancelledAt;
  var cancelledBy;
  var createdAt;
  var updatedAt;
  var hostPayout;
  var labelColor;
  var dateRange;
  var expirationTime;
  Host? host;
  Properties? properties;

  BookedProperties(
      {this.id,
      this.propertyId,
      this.code,
      this.hostId,
      this.userId,
      this.startDate,
      this.endDate,
      this.status,
      this.guest,
      this.totalNight,
      this.perNight,
      this.customPriceDates,
      this.basePrice,
      this.cleaningCharge,
      this.guestCharge,
      this.serviceCharge,
      this.securityMoney,
      this.ivaTax,
      this.accomodationTax,
      this.dateWithPrice,
      this.hostFee,
      this.total,
      this.bookingType,
      this.currencyCode,
      this.cancellation,
      this.transactionId,
      this.paymentMethodId,
      this.acceptedAt,
      this.attachment,
      this.bankId,
      this.note,
      this.expiredAt,
      this.declinedAt,
      this.cancelledAt,
      this.cancelledBy,
      this.createdAt,
      this.updatedAt,
      this.hostPayout,
      this.labelColor,
      this.dateRange,
      this.expirationTime,
      this.host,
      this.properties});

  BookedProperties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    code = json['code'];
    hostId = json['host_id'];
    userId = json['user_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    guest = json['guest'];
    totalNight = json['total_night'];
    perNight = json['per_night'];
    customPriceDates = json['custom_price_dates'];
    basePrice = json['base_price'];
    cleaningCharge = json['cleaning_charge'];
    guestCharge = json['guest_charge'];
    serviceCharge = json['service_charge'];
    securityMoney = json['security_money'];
    ivaTax = json['iva_tax'];
    accomodationTax = json['accomodation_tax'];
    dateWithPrice = json['date_with_price'];
    hostFee = json['host_fee'];
    total = json['per_night'];
    bookingType = json['booking_type'];
    currencyCode = json['currency_code'];
    cancellation = json['cancellation'];
    transactionId = json['transaction_id'];
    paymentMethodId = json['payment_method_id'];
    acceptedAt = json['accepted_at'];
    attachment = json['attachment'];
    bankId = json['bank_id'];
    note = json['note'];
    expiredAt = json['expired_at'];
    declinedAt = json['declined_at'];
    cancelledAt = json['cancelled_at'];
    cancelledBy = json['cancelled_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hostPayout = json['host_payout'];
    labelColor = json['label_color'];
    dateRange = json['date_range'];
    expirationTime = json['expiration_time'];
    host = json['host'] != null ? new Host.fromJson(json['host']) : null;
    properties = json['properties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['code'] = this.code;
    data['host_id'] = this.hostId;
    data['user_id'] = this.userId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['guest'] = this.guest;
    data['total_night'] = this.totalNight;
    data['per_night'] = this.perNight;
    data['custom_price_dates'] = this.customPriceDates;
    data['base_price'] = this.basePrice;
    data['cleaning_charge'] = this.cleaningCharge;
    data['guest_charge'] = this.guestCharge;
    data['service_charge'] = this.serviceCharge;
    data['security_money'] = this.securityMoney;
    data['iva_tax'] = this.ivaTax;
    data['accomodation_tax'] = this.accomodationTax;
    data['date_with_price'] = this.dateWithPrice;
    data['host_fee'] = this.hostFee;
    data['per_night'] = this.total;
    data['booking_type'] = this.bookingType;
    data['currency_code'] = this.currencyCode;
    data['cancellation'] = this.cancellation;
    data['transaction_id'] = this.transactionId;
    data['payment_method_id'] = this.paymentMethodId;
    data['accepted_at'] = this.acceptedAt;
    data['attachment'] = this.attachment;
    data['bank_id'] = this.bankId;
    data['note'] = this.note;
    data['expired_at'] = this.expiredAt;
    data['declined_at'] = this.declinedAt;
    data['cancelled_at'] = this.cancelledAt;
    data['cancelled_by'] = this.cancelledBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['host_payout'] = this.hostPayout;
    data['label_color'] = this.labelColor;
    data['date_range'] = this.dateRange;
    data['expiration_time'] = this.expirationTime;
    if (this.host != null) {
      data['host'] = this.host!.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Host {
  var id;
  var firstName;
  var lastName;
  var email;
  var phone;
  var formattedPhone;
  var carrierCode;
  var defaultCountry;
  var address;
  var profileImage;
  var balance;
  var status;
  var sponserCode;
  var referralCode;
  var userProMember;
  var userAgent;
  var userHost;
  var agentRequest;
  var hostRequest;
  var promemberRequest;
  var isAgent;
  var createdAt;
  var updatedAt;
  var profileSrc;

  Host(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.formattedPhone,
      this.carrierCode,
      this.defaultCountry,
      this.address,
      this.profileImage,
      this.balance,
      this.status,
      this.sponserCode,
      this.referralCode,
      this.userProMember,
      this.userAgent,
      this.userHost,
      this.agentRequest,
      this.hostRequest,
      this.promemberRequest,
      this.isAgent,
      this.createdAt,
      this.updatedAt,
      this.profileSrc});

  Host.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    formattedPhone = json['formatted_phone'];
    carrierCode = json['carrier_code'];
    defaultCountry = json['default_country'];
    address = json['address'];
    profileImage = json['profile_image'];
    balance = json['balance'];
    status = json['status'];
    sponserCode = json['sponser_code'];
    referralCode = json['referral_code'];
    userProMember = json['user_pro_member'];
    userAgent = json['user_agent'];
    userHost = json['user_host'];
    agentRequest = json['agent_request'];
    hostRequest = json['host_request'];
    promemberRequest = json['promember_request'];
    isAgent = json['is_agent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileSrc = json['profile_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['formatted_phone'] = this.formattedPhone;
    data['carrier_code'] = this.carrierCode;
    data['default_country'] = this.defaultCountry;
    data['address'] = this.address;
    data['profile_image'] = this.profileImage;
    data['balance'] = this.balance;
    data['status'] = this.status;
    data['sponser_code'] = this.sponserCode;
    data['referral_code'] = this.referralCode;
    data['user_pro_member'] = this.userProMember;
    data['user_agent'] = this.userAgent;
    data['user_host'] = this.userHost;
    data['agent_request'] = this.agentRequest;
    data['host_request'] = this.hostRequest;
    data['promember_request'] = this.promemberRequest;
    data['is_agent'] = this.isAgent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_src'] = this.profileSrc;
    return data;
  }
}
