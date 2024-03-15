import 'package:news_app/feature/headline/headline.dart';

import '../../../core/core.dart';

class HeadlineRepositoryImpl implements HeadlineRepository {
  final HeadlineApiRepository apiRepository;
  final HeadlineLocalRepository localRepository;

  HeadlineRepositoryImpl({
    required this.apiRepository,
    required this.localRepository,
  });

  @override
  Future<HeadlineResponseModel> getHeadlineNews([
    String apiKey = ApiConstant.apiKey,
    String countryId = ApiConstant.countryId,
  ]) async {
    try {
      var fromLocal = await localRepository.getHeadlineNews(apiKey, countryId);
      return fromLocal;
    } catch (_) {
      final data = await apiRepository.getHeadlineNews(apiKey, countryId);
      localRepository.saveHeadlineNews(data);
      return data;
    }
  }
}
