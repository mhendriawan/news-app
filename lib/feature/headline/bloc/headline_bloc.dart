import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../headline.dart';

class HeadlineBloc extends Bloc<HeadlineEvent, HeadlineState> {
  final HeadlineRepository repository;

  HeadlineBloc({required this.repository}) : super(InitialHeadline()) {
    on<HeadlineEvent>((event, emit) async {
      if (event is HeadlineFetched) {
        await _onFetchHeadline(emit);
      }
    });
  }

  Future<void> _onFetchHeadline(Emitter<HeadlineState> emit) async {
    try {
      emit(HeadlineLoading());
      HeadlineResponseModel headline = await repository.getHeadlineNews(
        ApiConstant.apiKey,
        ApiConstant.countryId,
      );
      if (headline.headlines.isEmpty) {
        emit(HeadlineNoData(headline.message ?? AppConstant.noData));
      } else {
        emit(HeadlineHasData(headline));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionError) {
        emit(HeadlineNoInternetConnection());
      } else {
        emit(HeadlineError(e.toString()));
      }
    }
  }
}
