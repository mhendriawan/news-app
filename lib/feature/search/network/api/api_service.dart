import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../search.dart';

class SearchApiService {
  final Dio dio;

  SearchApiService({required this.dio});

  Future<SearchResponseModel> getSearchNews(
    String apiKey,
    String search,
  ) async {
    try {
      final response = await dio.get(
        ApiConstant.searchNews,
        queryParameters: {"apiKey": apiKey, "q": search},
      );

      String resData = jsonEncode(response.data);

      final SearchResponseModel data = searchResponseModelFromJson(resData);
      return data;
    } on DioError catch (e) {
      return SearchResponseModel(
        status: "error",
        message: e.message ?? "",
        searches: const [],
      );
    }
  }
}
