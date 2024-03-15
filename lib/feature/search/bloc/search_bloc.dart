import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../repository/repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc({required this.repository}) : super(InitialSearch()) {
    on<SearchNews>(_onSearch);
  }

  FutureOr<void> _onSearch(
    SearchNews event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(SearchLoading());
      SearchResponseModel searchResponseModel = await repository.getSearchNews(
        ApiConstant.apiKey,
        event.query,
      );
      if (searchResponseModel.searches.isEmpty) {
        emit(SearchNoData(searchResponseModel.message ?? AppConstant.noData));
      } else {
        emit(SearchHasData(searchResponseModel));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionError) {
        emit(SearchNoInternetConnection());
      } else {
        emit(SearchError(e.toString()));
      }
    }
  }
}
