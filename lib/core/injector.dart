import 'package:get_it/get_it.dart';
import 'package:news_app/feature/headline/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../feature/headline/network/network.dart';
import '../feature/headline/repository/repository.dart';
import '../feature/search/search.dart';
import '../shared/shared.dart';
import 'dio_client.dart';

final inject = GetIt.instance;

Future<void> injectInit() async {
  // BLoC
  inject.registerFactory(() => HeadlineBloc(repository: inject()));
  inject.registerFactory(() => SearchBloc(repository: inject()));

  // Repository
  inject.registerLazySingleton<HeadlineRepository>(
    () => HeadlineRepositoryImpl(
      apiRepository: inject(),
      localRepository: inject(),
    ),
  );
  inject.registerLazySingleton(
    () => HeadlineLocalRepository(prefHelper: inject()),
  );
  inject.registerLazySingleton(
    () => HeadlineApiRepository(apiService: inject()),
  );

  inject.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      apiRepository: inject(),
      localRepository: inject(),
    ),
  );
  inject.registerLazySingleton(
    () => SearchLocalRepository(prefHelper: inject()),
  );
  inject.registerLazySingleton(
    () => SearchApiRepository(apiService: inject()),
  );

  // Local
  final preferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => preferences);
  inject.registerLazySingleton(() => SharedPrefHelper(preferences: inject()));

  // Network
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(() => DioClient());
  inject.registerLazySingleton(() => HeadlineApiService(dio: inject()));
  inject.registerLazySingleton(() => SearchApiService(dio: inject()));
}
