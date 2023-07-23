import '../model/headline_model.dart';

abstract class HeadlineRepository {
  Future<List<HeadlineModel>> getAllTopHeadlines();
}
