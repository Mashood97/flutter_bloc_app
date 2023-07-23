// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headline_chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$HeadlineService extends HeadlineService {
  _$HeadlineService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HeadlineService;

  @override
  Future<Response<Map<dynamic, dynamic>>> getTopHeadlines({
    required String apiKey,
    String countryCode = "us",
    String headlineCategory = "business",
  }) {
    final Uri $url = Uri.parse('/top-headlines');
    final Map<String, dynamic> $params = <String, dynamic>{
      'apiKey': apiKey,
      'country': countryCode,
      'category': headlineCategory,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }
}
