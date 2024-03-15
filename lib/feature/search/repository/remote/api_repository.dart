import '../../../../core/core.dart';
import '../../search.dart';

class SearchApiRepository implements SearchRepository {
  final SearchApiService apiService;

  SearchApiRepository({required this.apiService});

  @override
  Future<SearchResponseModel> getSearchNews([
    String apiKey = ApiConstant.apiKey,
    String search = '',
  ]) {
    return apiService.getSearchNews(apiKey, search);
  }
}
