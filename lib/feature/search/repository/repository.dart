import '../network/network.dart';

export 'local/local_repository.dart';
export 'remote/api_repository.dart';
export 'search_repository.dart';

abstract class SearchRepository {
  Future<SearchResponseModel> getSearchNews(String apiKey, String search);
}
