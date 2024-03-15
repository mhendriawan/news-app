import '../../../../core/core.dart';
import '../../headline.dart';

class HeadlineApiRepository implements HeadlineRepository {
  final HeadlineApiService apiService;

  HeadlineApiRepository({required this.apiService});

  @override
  Future<HeadlineResponseModel> getHeadlineNews([
    String apiKey = ApiConstant.apiKey,
    String countryId = ApiConstant.countryId,
  ]) {
    return apiService.getHeadlineNews(apiKey, countryId);
  }
}
