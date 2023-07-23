import "dart:async";
import 'package:bloc_article_app/constant/api.dart';
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "headline_chopper_service.chopper.dart";

@ChopperApi()
abstract class HeadlineService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static HeadlineService create([ChopperClient? client]) =>
      _$HeadlineService(client);

  @Get(
    path: ApiConfiguration.getTopHeadlines,
  )
  Future<Response<Map>> getTopHeadlines({
    @Query("apiKey") required String apiKey,
    @Query("country") String countryCode = "us",
    @Query("category") String headlineCategory = "business",
  });

  @Get(
    path: ApiConfiguration.getTopHeadlines,
  )
  Future<Response<Map>> searchHeadlines({
    @Query("apiKey") required String apiKey,
    @Query("q") String searchQuery = "",
  });
}
