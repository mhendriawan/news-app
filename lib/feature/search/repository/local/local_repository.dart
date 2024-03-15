import 'package:news_app/core/core.dart';
import 'package:news_app/shared/shared.dart';

import '../../search.dart';

class SearchLocalRepository implements SearchRepository {
  final SharedPrefHelper prefHelper;

  SearchLocalRepository({required this.prefHelper});

  @override
  Future<SearchResponseModel> getSearchNews(String apiKey, String query) async {
    String fromCache = await prefHelper.getCache(PrefKey.search);
    return searchResponseModelFromJson(fromCache);
  }

  Future<bool> saveSearchNews(SearchResponseModel result) {
    return prefHelper.storeCache(
      PrefKey.search,
      searchResponseModelToJson(result),
      lastChecked: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
