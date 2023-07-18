class DashBoard_model {
  var status;
  var message;
  Data? data;

  DashBoard_model({this.status, this.message, this.data});

  DashBoard_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<StartingCities>? startingCities;
  List<Properties>? properties;
  List<Testimonials>? testimonials;
  List<PropertyType>? propertyType;
  var dateFormat;

  Data(
      {this.startingCities,
      this.properties,
      this.testimonials,
      this.propertyType,
      this.dateFormat});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['starting_cities'] != null) {
      startingCities = <StartingCities>[];
      json['starting_cities'].forEach((v) {
        startingCities!.add(StartingCities.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    if (json['testimonials'] != null) {
      testimonials = <Testimonials>[];
      json['testimonials'].forEach((v) {
        testimonials!.add(Testimonials.fromJson(v));
      });
    }
    if (json['property_type'] != null) {
      propertyType = <PropertyType>[];
      json['property_type'].forEach((v) {
        propertyType!.add(PropertyType.fromJson(v));
      });
    }
    dateFormat = json['date_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (startingCities != null) {
      data['starting_cities'] = startingCities!.map((v) => v.toJson()).toList();
    }
    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    if (testimonials != null) {
      data['testimonials'] = testimonials!.map((v) => v.toJson()).toList();
    }
    if (propertyType != null) {
      data['property_type'] = propertyType!.map((v) => v.toJson()).toList();
    }
    data['date_format'] = dateFormat;
    return data;
  }
}

class StartingCities {
  var name;
  var image;
  var imageUrl;

  StartingCities({this.name, this.image, this.imageUrl});

  StartingCities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Properties {
  var id;
  var propertyName;
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
  var wishlist;
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
  Users? users;
  PropertyPrice? propertyPrice;
  PropertyAddress? propertyAddress;

  Properties(
      {this.id,
      this.propertyName,
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
      this.stepsCompleted,
      this.spaceTypeName,
      this.propertyTypeName,
      this.propertyPhoto,
      this.hostName,
      this.bookMark,
      this.reviewsCount,
      this.overallRating,
      this.coverPhoto,
      this.avgRating,
      this.users,
      this.propertyPrice,
      this.propertyAddress});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyName = json['property_name'];
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
    wishlist = json['wishlist'];
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
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    propertyPrice = json['property_price'] != null
        ? PropertyPrice.fromJson(json['property_price'])
        : null;
    propertyAddress = json['property_address'] != null
        ? PropertyAddress.fromJson(json['property_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_name'] = propertyName;
    data['name'] = name;
    data['slug'] = slug;
    data['url_name'] = urlName;
    data['host_id'] = hostId;
    data['bedrooms'] = bedrooms;
    data['beds'] = beds;
    data['bed_type'] = bedType;
    data['bathrooms'] = bathrooms;
    data['guest'] = guest;
    data['extra_mattress'] = extraMattress;
    data['living_rooms'] = livingRooms;
    data['kitchen'] = kitchen;
    data['amenities'] = amenities;
    data['property_type'] = propertyType;
    data['space_type'] = spaceType;
    data['accommodates'] = accommodates;
    data['booking_type'] = bookingType;
    data['cancellation'] = cancellation;
    data['status'] = status;
    data['recomended'] = recomended;
    data['square_feet'] = squareFeet;
    data['constructed_square_feet'] = constructedSquareFeet;
    data['stay_timing'] = stayTiming;
    data['verified_property'] = verifiedProperty;
    data['is_agree'] = isAgree;
    data['view_count'] = viewCount;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['wishlist'] = wishlist;
    data['steps_completed'] = stepsCompleted;
    data['space_type_name'] = spaceTypeName;
    data['property_type_name'] = propertyTypeName;
    data['property_photo'] = propertyPhoto;
    data['host_name'] = hostName;
    data['book_mark'] = bookMark;
    data['reviews_count'] = reviewsCount;
    data['overall_rating'] = overallRating;
    data['cover_photo'] = coverPhoto;
    data['avg_rating'] = avgRating;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    if (propertyPrice != null) {
      data['property_price'] = propertyPrice!.toJson();
    }
    if (propertyAddress != null) {
      data['property_address'] = propertyAddress!.toJson();
    }
    return data;
  }
}

class Users {
  var id;
  var firstName;
  var lastName;
  var email;
  var phone;
  var formattedPhone;
  var carrierCode;
  var defaultCountry;
  var profileImage;
  var balance;
  var status;
  var createdAt;
  var updatedAt;
  var profileSrc;

  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.formattedPhone,
      this.carrierCode,
      this.defaultCountry,
      this.profileImage,
      this.balance,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.profileSrc});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    formattedPhone = json['formatted_phone'];
    carrierCode = json['carrier_code'];
    defaultCountry = json['default_country'];
    profileImage = json['profile_image'];
    balance = json['balance'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileSrc = json['profile_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['formatted_phone'] = formattedPhone;
    data['carrier_code'] = carrierCode;
    data['default_country'] = defaultCountry;
    data['profile_image'] = profileImage;
    data['balance'] = balance;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_src'] = profileSrc;
    return data;
  }
}

class PropertyPrice {
  var id;
  var propertyId;
  var cleaningFee;
  var guestAfter;
  var guestFee;
  var securityFee;
  var price;
  var weekendPrice;
  var weeklyDiscount;
  var monthlyDiscount;
  var currencyCode;
  var originalCleaningFee;
  var originalGuestFee;
  var originalPrice;
  var originalWeekendPrice;
  var originalSecurityFee;
  var defaultCode;
  var defaultSymbol;

  PropertyPrice(
      {this.id,
      this.propertyId,
      this.cleaningFee,
      this.guestAfter,
      this.guestFee,
      this.securityFee,
      this.price,
      this.weekendPrice,
      this.weeklyDiscount,
      this.monthlyDiscount,
      this.currencyCode,
      this.originalCleaningFee,
      this.originalGuestFee,
      this.originalPrice,
      this.originalWeekendPrice,
      this.originalSecurityFee,
      this.defaultCode,
      this.defaultSymbol});

  PropertyPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    cleaningFee = json['cleaning_fee'];
    guestAfter = json['guest_after'];
    guestFee = json['guest_fee'];
    securityFee = json['security_fee'];
    price = json['price'];
    weekendPrice = json['weekend_price'];
    weeklyDiscount = json['weekly_discount'];
    monthlyDiscount = json['monthly_discount'];
    currencyCode = json['currency_code'];
    originalCleaningFee = json['original_cleaning_fee'];
    originalGuestFee = json['original_guest_fee'];
    originalPrice = json['original_price'];
    originalWeekendPrice = json['original_weekend_price'];
    originalSecurityFee = json['original_security_fee'];
    defaultCode = json['default_code'];
    defaultSymbol = json['default_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['cleaning_fee'] = cleaningFee;
    data['guest_after'] = guestAfter;
    data['guest_fee'] = guestFee;
    data['security_fee'] = securityFee;
    data['price'] = price;
    data['weekend_price'] = weekendPrice;
    data['weekly_discount'] = weeklyDiscount;
    data['monthly_discount'] = monthlyDiscount;
    data['currency_code'] = currencyCode;
    data['original_cleaning_fee'] = originalCleaningFee;
    data['original_guest_fee'] = originalGuestFee;
    data['original_price'] = originalPrice;
    data['original_weekend_price'] = originalWeekendPrice;
    data['original_security_fee'] = originalSecurityFee;
    data['default_code'] = defaultCode;
    data['default_symbol'] = defaultSymbol;
    return data;
  }
}

class PropertyAddress {
  var id;
  var propertyId;
  var addressLine1;
  var addressLine2;
  var latitude;
  var longitude;
  var city;
  var state;
  var country;
  var postalCode;

  PropertyAddress(
      {this.id,
      this.propertyId,
      this.addressLine1,
      this.addressLine2,
      this.latitude,
      this.longitude,
      this.city,
      this.state,
      this.country,
      this.postalCode});

  PropertyAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    return data;
  }
}

class Testimonials {
  var id;
  var name;
  var designation;
  var image;
  var description;
  var review;
  var status;
  var createdAt;
  var updatedAt;

  Testimonials(
      {this.id,
      this.name,
      this.designation,
      this.image,
      this.description,
      this.review,
      this.status,
      this.createdAt,
      this.updatedAt});

  Testimonials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    designation = json['designation'];
    image = json['image'];
    description = json['description'];
    review = json['review'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['designation'] = designation;
    data['image'] = image;
    data['description'] = description;
    data['review'] = review;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PropertyType {
  var id;
  var name;
  var description;
  var icon;
  var status;

  PropertyType({this.id, this.name, this.description, this.icon, this.status});

  PropertyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['icon'] = icon;
    data['status'] = status;
    return data;
  }
}
