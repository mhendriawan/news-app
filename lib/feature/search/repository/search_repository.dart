import 'repository.dart';

export 'package:news_app/feature/search/search.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchApiRepository apiRepository;
  final SearchLocalRepository localRepository;

  SearchRepositoryImpl({
    required this.apiRepository,
    required this.localRepository,
  });

  @override
  Future<SearchResponseModel> getSearchNews(String apiKey, String query) async {
    final data = await apiRepository.getSearchNews(apiKey, query);
    localRepository.saveSearchNews(data);
    return data;
  }
}
