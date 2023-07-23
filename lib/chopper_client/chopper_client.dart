import 'package:bloc_article_app/chopper_client/converter/json_type_parser.dart';
import 'package:bloc_article_app/constant/api.dart';
import 'package:bloc_article_app/src/headlines/service/headline_chopper_service.dart';
import 'package:chopper/chopper.dart';

import 'converter/json_serializable_converter.dart';
import 'dummy_model.dart';
import 'interceptor/header_interceptor.dart';
import 'interceptor/internet_connection_interceptor.dart';

class ChopperClientInstance {
  static final ChopperClientInstance _singleton =
      ChopperClientInstance._internal();

  factory ChopperClientInstance() {
    return _singleton;
  }

  ChopperClientInstance._internal();

  static const converter = JsonSerializableConverter(JsonTypeParser.factories);

  static ChopperClient? client;

  static void initializeChopperClient() {
    client ??= ChopperClient(
        baseUrl: Uri.parse(ApiConfiguration.kBaseUrl),
        services: [
          // Create and pass an instance of the generated service to the client
          HeadlineService.create(),
        ],
        // converter: const JsonConverter(),
        // errorConverter: const JsonConverter(),
        converter: converter,
        errorConverter: converter,
        interceptors: [
          InternetConnectionInterceptor(),
          HeaderInterceptor(),
          HttpLoggingInterceptor(),
        ]);
  }
}
