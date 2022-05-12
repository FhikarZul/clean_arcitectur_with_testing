import 'package:clean_arcitectur_with_testing/domain/usecase/get_post_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'data/datasource/post_remote_data_source.dart';
import 'data/repository/post_repository_impl.dart';
import 'domain/repository/post_repository.dart';

final locator = GetIt.instance;

void initInjection() {
  // Http Client
  locator.registerLazySingleton<http.Client>(() => http.Client());

  // Remote data source
  locator.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(locator.get()),
  );

  // Repository
  locator.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(locator.get()),
  );

  // Use case
  locator.registerFactory(() => GetPostUsecase(locator.get()));
}
