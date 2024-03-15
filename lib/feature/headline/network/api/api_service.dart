import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../network.dart';

class HeadlineApiService {
  final Dio dio;

  HeadlineApiService({required this.dio});

  Future<HeadlineResponseModel> getHeadlineNews(
    String apiKey,
    String countryId,
  ) async {
    try {
      final response = await dio.get(
        ApiConstant.headlineNews,
        queryParameters: {"apiKey": apiKey, "country": countryId},
      );

      String resData = jsonEncode(response.data);

      final HeadlineResponseModel data = headlineResponseModelFromJson(resData);
      return data;
    } on DioError catch (e) {
      return HeadlineResponseModel(
        status: "error",
        message: e.message ?? "",
        headlines: const [],
      );
    }
  }
}
