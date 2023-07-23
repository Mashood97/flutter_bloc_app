import '../model/headline_model.dart';

abstract class HeadlineRepository {
  Future<List<HeadlineModel>> getAllTopHeadlines({
    String headlineCategory = "business",
  });
  Future<List<HeadlineModel>> searchHeadlines({
    String searchText = "",
  });
}
