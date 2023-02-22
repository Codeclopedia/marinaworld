// To parse this JSON data, do
//
//     final countriesDataResponse = countriesDataResponseFromJson(jsonString);

import 'dart:convert';

class CountriesDataResponse {
  CountriesDataResponse({
    this.message,
    this.data,
    this.status,
  });

  String? message;
  List<Countries>? data;
  String? status;

  factory CountriesDataResponse.fromRawJson(String str) =>
      CountriesDataResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountriesDataResponse.fromJson(Map<String, dynamic> json) =>
      CountriesDataResponse(
        message: json["message"],
        data: List<Countries>.from(
            json["data"].map((x) => Countries.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
        "status": status,
      };
}

class Countries {
  Countries({
    this.name,
    this.nameAr,
    this.code,
  });

  String? name;
  String? nameAr;
  String? code;

  factory Countries.fromRawJson(String str) =>
      Countries.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        name: json["name"],
        nameAr: json["name_ar"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_ar": nameAr,
        "code": code,
      };
}
