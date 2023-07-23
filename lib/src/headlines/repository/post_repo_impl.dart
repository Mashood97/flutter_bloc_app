import 'dart:convert';
import 'dart:developer';

import 'package:bloc_article_app/chopper_client/exception/response_error.dart';
import 'package:bloc_article_app/constant/api.dart';

import '../../../chopper_client/chopper_client.dart';
import '../../../chopper_client/response_handler/list_response_handler.dart';
import '../model/headline_model.dart';
import '../service/headline_chopper_service.dart';
import 'headline_repo.dart';

class HeadlineRepositoryImplementation implements HeadlineRepository {
  final postService = HeadlineService.create(ChopperClientInstance.client);

  @override
  Future<List<HeadlineModel>> getAllTopHeadlines() async {
    try {
      final response = await postService.getTopHeadlines(
        apiKey: ApiConfiguration.apiKey,
      );

      if (response.isSuccessful == true) {
        // Successful request
        final body = response.bodyString;
        if (body.isNotEmpty == true) {
          final decodedBody = jsonDecode(body);
          final decodedResponse = ListResponse<HeadlineModel>.fromJson(
              decodedBody, (json) => HeadlineModel.fromJson(json),
              keyName: "articles");
          if (decodedResponse.statusMessage == "ok") {
            return decodedResponse.data ?? [];
          }
        }

        return [];
      } else {
        // Error code received from server
        final code = response.statusCode;
        final error = response.error as ResponseError;
        log("ERROR CODE:: $code ==> Error Msg ==>> ${error.toString()}");

        throw error;
      }
    } on ResponseError catch (e) {
      log("Catch Response Error Block==> Error Msg ==>> $e");

      throw ResponseError(
        errorStatus: e.errorStatus,
      );
    } catch (e) {
      log("Catch Block==> Error Msg ==>> $e");

      throw ResponseError(
        errorStatus: e.toString(),
      );
    }
  }
}
