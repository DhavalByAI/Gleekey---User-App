// ignore_for_file: file_names, camel_case_types

class User_model {
  var status;
  var message;
  Data? data;
  var accessToken;
  var tokenType;

  User_model(
      {this.status, this.message, this.data, this.accessToken, this.tokenType});

  User_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class Data {
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

  Data(
      {this.id = '',
      this.firstName = 'User',
      this.lastName = 'Name',
      this.email = 'user@email.com',
      this.phone,
      this.formattedPhone,
      this.carrierCode,
      this.defaultCountry,
      this.profileImage = '',
      this.balance,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.profileSrc =
          'https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'});

  Data.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['formatted_phone'] = this.formattedPhone;
    data['carrier_code'] = this.carrierCode;
    data['default_country'] = this.defaultCountry;
    data['profile_image'] = this.profileImage;
    data['balance'] = this.balance;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_src'] = this.profileSrc;
    return data;
  }
}
