class Receipt_model {
  var status;
  var message;
  Data? data;

  Receipt_model({this.status, this.message, this.data});

  Receipt_model.fromJson(Map<String, dynamic> json) {
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
  Booking? booking;
  List<DatePrice>? datePrice;
  var title;
  var additionalTitle;

  Data({this.booking, this.datePrice, this.title, this.additionalTitle});

  Data.fromJson(Map<String, dynamic> json) {
    booking =
        json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
    if (json['date_price'] != null) {
      datePrice = <DatePrice>[];
      json['date_price'].forEach((v) {
        datePrice!.add(new DatePrice.fromJson(v));
      });
    }
    title = json['title'];
    additionalTitle = json['additional_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    if (this.datePrice != null) {
      data['date_price'] = this.datePrice!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['additional_title'] = this.additionalTitle;
    return data;
  }
}

class Booking {
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
  var couponcode;
  var couponcodeAmount;
  var bookingAmount;
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
  var isAgent;
  var hostPayout;
  var labelColor;
  var dateRange;
  var expirationTime;
  ReceiptProperties? properties;

  Booking(
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
      this.couponcode,
      this.couponcodeAmount,
      this.bookingAmount,
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
      this.isAgent,
      this.hostPayout,
      this.labelColor,
      this.dateRange,
      this.expirationTime,
      this.properties});

  Booking.fromJson(Map<String, dynamic> json) {
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
    couponcode = json['couponcode'];
    couponcodeAmount = json['couponcode_amount'];
    bookingAmount = json['booking_amount'];
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
    isAgent = json['is_agent'];
    hostPayout = json['host_payout'];
    labelColor = json['label_color'];
    dateRange = json['date_range'];
    expirationTime = json['expiration_time'];
    properties = json['properties'] != null
        ? new ReceiptProperties.fromJson(json['properties'])
        : null;
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
    data['couponcode'] = this.couponcode;
    data['couponcode_amount'] = this.couponcodeAmount;
    data['booking_amount'] = this.bookingAmount;
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
    data['is_agent'] = this.isAgent;
    data['host_payout'] = this.hostPayout;
    data['label_color'] = this.labelColor;
    data['date_range'] = this.dateRange;
    data['expiration_time'] = this.expirationTime;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class ReceiptProperties {
  var id;
  var agentId;
  var name;
  var slug;
  var urlName;
  var hostId;
  var bedrooms;
  var beds;
  var bedType;
  var bathrooms;
  var guest;
  var extraMattress;
  var livingRooms;
  var kitchen;
  var amenities;
  var propertyType;
  var spaceType;
  var accommodates;
  var bookingType;
  var cancellation;
  var status;
  var recomended;
  var squareFeet;
  var constructedSquareFeet;
  var stayTiming;
  var verifiedProperty;
  var isAgree;
  var viewCount;
  var deletedAt;
  var createdAt;
  var updatedAt;
  var isApprove;
  var stepsCompleted;
  var spaceTypeName;
  var propertyTypeName;
  var propertyPhoto;
  var hostName;
  var bookMark;
  var reviewsCount;
  var overallRating;
  var coverPhoto;
  var avgRating;

  ReceiptProperties(
      {this.id,
      this.agentId,
      this.name,
      this.slug,
      this.urlName,
      this.hostId,
      this.bedrooms,
      this.beds,
      this.bedType,
      this.bathrooms,
      this.guest,
      this.extraMattress,
      this.livingRooms,
      this.kitchen,
      this.amenities,
      this.propertyType,
      this.spaceType,
      this.accommodates,
      this.bookingType,
      this.cancellation,
      this.status,
      this.recomended,
      this.squareFeet,
      this.constructedSquareFeet,
      this.stayTiming,
      this.verifiedProperty,
      this.isAgree,
      this.viewCount,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.isApprove,
      this.stepsCompleted,
      this.spaceTypeName,
      this.propertyTypeName,
      this.propertyPhoto,
      this.hostName,
      this.bookMark,
      this.reviewsCount,
      this.overallRating,
      this.coverPhoto,
      this.avgRating});

  ReceiptProperties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    name = json['name'];
    slug = json['slug'];
    urlName = json['url_name'];
    hostId = json['host_id'];
    bedrooms = json['bedrooms'];
    beds = json['beds'];
    bedType = json['bed_type'];
    bathrooms = json['bathrooms'];
    guest = json['guest'];
    extraMattress = json['extra_mattress'];
    livingRooms = json['living_rooms'];
    kitchen = json['kitchen'];
    amenities = json['amenities'];
    propertyType = json['property_type'];
    spaceType = json['space_type'];
    accommodates = json['accommodates'];
    bookingType = json['booking_type'];
    cancellation = json['cancellation'];
    status = json['status'];
    recomended = json['recomended'];
    squareFeet = json['square_feet'];
    constructedSquareFeet = json['constructed_square_feet'];
    stayTiming = json['stay_timing'];
    verifiedProperty = json['verified_property'];
    isAgree = json['is_agree'];
    viewCount = json['view_count'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isApprove = json['is_approve'];
    stepsCompleted = json['steps_completed'];
    spaceTypeName = json['space_type_name'];
    propertyTypeName = json['property_type_name'];
    propertyPhoto = json['property_photo'];
    hostName = json['host_name'];
    bookMark = json['book_mark'];
    reviewsCount = json['reviews_count'];
    overallRating = json['overall_rating'];
    coverPhoto = json['cover_photo'];
    avgRating = json['avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['url_name'] = this.urlName;
    data['host_id'] = this.hostId;
    data['bedrooms'] = this.bedrooms;
    data['beds'] = this.beds;
    data['bed_type'] = this.bedType;
    data['bathrooms'] = this.bathrooms;
    data['guest'] = this.guest;
    data['extra_mattress'] = this.extraMattress;
    data['living_rooms'] = this.livingRooms;
    data['kitchen'] = this.kitchen;
    data['amenities'] = this.amenities;
    data['property_type'] = this.propertyType;
    data['space_type'] = this.spaceType;
    data['accommodates'] = this.accommodates;
    data['booking_type'] = this.bookingType;
    data['cancellation'] = this.cancellation;
    data['status'] = this.status;
    data['recomended'] = this.recomended;
    data['square_feet'] = this.squareFeet;
    data['constructed_square_feet'] = this.constructedSquareFeet;
    data['stay_timing'] = this.stayTiming;
    data['verified_property'] = this.verifiedProperty;
    data['is_agree'] = this.isAgree;
    data['view_count'] = this.viewCount;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_approve'] = this.isApprove;
    data['steps_completed'] = this.stepsCompleted;
    data['space_type_name'] = this.spaceTypeName;
    data['property_type_name'] = this.propertyTypeName;
    data['property_photo'] = this.propertyPhoto;
    data['host_name'] = this.hostName;
    data['book_mark'] = this.bookMark;
    data['reviews_count'] = this.reviewsCount;
    data['overall_rating'] = this.overallRating;
    data['cover_photo'] = this.coverPhoto;
    data['avg_rating'] = this.avgRating;
    return data;
  }
}

class DatePrice {
  var price;
  var date;

  DatePrice({this.price, this.date});

  DatePrice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['date'] = this.date;
    return data;
  }
}
