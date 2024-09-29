import "package:json_annotation/json_annotation.dart";
part 'response.g.dart';

@JsonSerializable() //from_json and to_json
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustamerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifaction")
  int? numOfNotifaction;
  CustamerResponse(this.id, this.name, this.numOfNotifaction);
  factory CustamerResponse.fromJson(Map<String, dynamic> json) {
    print("soso");
    print(json);
    return _$CustamerResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CustamerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "email")
  String? email;
  ContactsResponse(this.phone, this.link, this.email);
  factory ContactsResponse.fromJson(Map<String, dynamic> json) {
    print("soso");
    print(json);
    return _$ContactsResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "custamer")
  CustamerResponse? custamer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.contacts, this.custamer);
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    print("soso");
    print(json);
    return _$AuthenticationResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class ForgetPasswordResponse extends BaseResponse {
  @JsonKey(name: "support")
  String? support;

  ForgetPasswordResponse(this.support);
  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}
//home

@JsonSerializable()
class ServicesResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  ServicesResponse(this.id, this.title, this.image);
  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    return _$ServicesResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}

@JsonSerializable()
class BannersResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "image")
  String? image;
  BannersResponse(this.id, this.title, this.link, this.image);
  factory BannersResponse.fromJson(Map<String, dynamic> json) {
    return _$BannersResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}

@JsonSerializable()
class StoresResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  String? image;
  StoresResponse(this.id, this.title, this.image);
  factory StoresResponse.fromJson(Map<String, dynamic> json) {
    return _$StoresResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$StoresResponseToJson(this);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: "services")
  List<ServicesResponse>? services;
  @JsonKey(name: "banners")
  List<BannersResponse>? banners;
  @JsonKey(name: "stores")
  List<StoresResponse>? stores;
  HomeDataResponse(this.services, this.banners, this.stores);
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) {
    return _$HomeDataResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: "data")
  HomeDataResponse? data;
  HomeResponse(this.data);
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

//store
@JsonSerializable()
class StoreDetailsResponse extends BaseResponse {
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "details")
  String details;
  @JsonKey(name: "services")
  String services;
  @JsonKey(name: "about")
  String about;
  StoreDetailsResponse(
    this.image,
    this.id,
    this.title,
    this.details,
    this.services,
    this.about,
  );
  factory StoreDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StoreDetailsResponseToJson(this);
}
