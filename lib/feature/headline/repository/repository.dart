export 'local/local_repository.dart';
export 'remote/api_repository.dart';
export 'headline_repository.dart';

import '../../../core/core.dart';
import '../headline.dart';

abstract class HeadlineRepository {
  Future<HeadlineResponseModel> getHeadlineNews([
    String apiKey = ApiConstant.apiKey,
    String countryId = ApiConstant.countryId,
  ]);
}
