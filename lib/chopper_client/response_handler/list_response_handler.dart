import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

import '../exception/response_error.dart';
import 'base_response.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> extends BaseResponse {
  List<T>? data;

  ListResponse({
    dynamic message,
    int? totalResults,
    this.data,
  }) : super(statusMessage: message, totalResults: totalResults);

  factory ListResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create,
      {String keyName = "articles"}) {
    try {
      List<T>? dataWork = [];
      if (json[keyName] != null) {
        json[keyName].forEach((v) {
          dataWork.add(create(v));
        });
      } else {
        json[keyName] = [];
      }
      return ListResponse<T>(
          message: json["status"],
          totalResults: json['totalResults'],
          data: dataWork.isEmpty ? [] : dataWork);
    } catch (e) {
      if (e is CheckedFromJsonException) {
        log(
          "====>>>Parsing Issue in list response handler====>>> ${e.toString()}\n=====>>>>>>>>Parsing issue end in list response handler",
        );

        // log(level: );
        throw ResponseError(
          errorStatus:
              "Something went wrong with : ${e.message ?? e.toString()}",
        );
      }
    }
    return ListResponse<T>(
      message: json["status"],
      totalResults: json['totalResults'],
      data: [],
    );
  }
}
