import 'package:gleekey_user/src/Menu/DashBoard/dashBoard_model.dart';

class PropertyTypeById_model {
  bool? status;
  String? message;
  Data? data;

  PropertyTypeById_model({this.status, this.message, this.data});

  PropertyTypeById_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? title;
  PropertyType? propertyType;
  List<Properties>? properties;
  CurrentCurrency? currentCurrency;

  Data({this.title, this.propertyType, this.properties, this.currentCurrency});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    propertyType = json['property_type'] != null
        ? PropertyType.fromJson(json['property_type'])
        : null;
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    currentCurrency = json['currentCurrency'] != null
        ? CurrentCurrency.fromJson(json['currentCurrency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    if (this.propertyType != null) {
      data['property_type'] = this.propertyType!.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    if (this.currentCurrency != null) {
      data['currentCurrency'] = this.currentCurrency!.toJson();
    }
    return data;
  }
}

class CurrentCurrency {
  var id;
  String? name;
  String? code;
  String? symbol;
  String? rate;
  String? status;
  String? default_;
  String? orgSymbol;

  CurrentCurrency(
      {this.id,
      this.name,
      this.code,
      this.symbol,
      this.rate,
      this.status,
      this.default_,
      this.orgSymbol});

  CurrentCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    status = json['status'];
    default_ = json['default'];
    orgSymbol = json['org_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['rate'] = this.rate;
    data['status'] = this.status;
    data['default'] = this.default_;
    data['org_symbol'] = this.orgSymbol;
    return data;
  }
}
