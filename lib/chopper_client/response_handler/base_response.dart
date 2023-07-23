import 'package:flutter/services.dart';

class BaseResponse {
  String? statusMessage;
  int? totalResults;

  BaseResponse({this.statusMessage, this.totalResults});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        statusMessage: json["status"], totalResults: json['totalResults']);
  }
}
