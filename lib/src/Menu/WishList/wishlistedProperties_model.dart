import 'package:gleekey_user/src/Menu/DashBoard/dashBoard_model.dart';

class WishlistedProperties_model {
  var status;
  var message;
  List<Data>? data;

  WishlistedProperties_model({this.status, this.message, this.data});

  WishlistedProperties_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  var id;
  var propertyId;
  var userId;
  var status;
  var createdAt;
  var updatedAt;
  Properties? properties;

  Data(
      {this.id,
      this.propertyId,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.properties});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}
