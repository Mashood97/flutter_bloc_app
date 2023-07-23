import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

import '../exception/response_error.dart';
import 'base_response.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class SingleResponse<T> extends BaseResponse {
  T? response;

  SingleResponse({
    dynamic message,
    int? totalResults,
    this.response,
  }) : super(statusMessage: message, totalResults: totalResults);

  factory SingleResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    try {
      return SingleResponse<T>(
          message: json["status"],
          totalResults: json['totalResults'],
          response: json["response"] == null
              ? create({})
              : json["response"] is List
                  ? create({})
                  : create(json["response"]));
    } catch (e) {
      if (e is CheckedFromJsonException) {
        log(
          "====>>>Parsing Issue in single response handler====>>> ${e.toString()}\n=====>>>>>>>>Parsing issue end in single response handler",
        );

        throw ResponseError(
          errorStatus:
              "Something went wrong with : ${e.message ?? e.toString()}",
        );
      }
      return SingleResponse<T>(
          message: json["status"],
          totalResults: json['totalResults'],
          response: create({}));
    }
  }
}