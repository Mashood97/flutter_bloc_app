import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../chopper_client/exception/response_error.dart';
import '../model/headline_model.dart';
import '../repository/headline_repo.dart';

part 'headline_state.dart';

class HeadlineCubit extends Cubit<HeadlineState> {
  final HeadlineRepository _postRepository;
  HeadlineCubit(this._postRepository) : super(const HeadlineInitial());

  Future<void> getTopHeadlines({String headlineCategory = "business"}) async {
    try {
      emit(const HeadlineLoading());
      final headlines = await _postRepository.getAllTopHeadlines(
        headlineCategory: headlineCategory,
      );
      if (headlines.isNotEmpty) {
        emit(HeadlineLoaded(headlines));
      } else {
        emit(const HeadlineError(
            "Something went wrong, please try again later"));
      }
    } on ResponseError catch (e) {
      emit(
        HeadlineError(e.errorStatus),
      );
    }
  }

  Future<void> searchHeadlines({String searchText = ""}) async {
    try {
      emit(const HeadlineLoading());
      final headlines = await _postRepository.searchHeadlines(
        searchText: searchText,
      );
      if (headlines.isNotEmpty) {
        emit(HeadlineLoaded(headlines));
      } else {
        emit(const HeadlineError(
            "Something went wrong, please try again later"));
      }
    } on ResponseError catch (e) {
      emit(
        HeadlineError(e.errorStatus),
      );
    }
  }
}
