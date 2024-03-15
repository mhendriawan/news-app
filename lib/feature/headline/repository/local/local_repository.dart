import 'package:news_app/core/core.dart';
import 'package:news_app/feature/headline/headline.dart';
import 'package:news_app/shared/shared.dart';

class HeadlineLocalRepository implements HeadlineRepository {
  final SharedPrefHelper prefHelper;

  HeadlineLocalRepository({required this.prefHelper});

  @override
  Future<HeadlineResponseModel> getHeadlineNews([
    String apiKey = ApiConstant.apiKey,
    String countryId = ApiConstant.countryId,
  ]) async {
    String fromCache = await prefHelper.getCache(PrefKey.headline);
    return headlineResponseModelFromJson(fromCache);
  }

  Future<bool> saveHeadlineNews(HeadlineResponseModel result) {
    return prefHelper.storeCache(
      PrefKey.headline,
      headlineResponseModelToJson(result),
      lastChecked: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
