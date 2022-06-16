import 'package:clean_arcitectur_with_testing/data/datasource/comments_remote_data_source.dart';
import 'package:clean_arcitectur_with_testing/data/repository/comments_repository_impl.dart';
import 'package:clean_arcitectur_with_testing/domain/repository/comments_respository.dart';
import 'package:clean_arcitectur_with_testing/domain/usecase/get_comments_usecase.dart';
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
  locator.registerLazySingleton<IPostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(client: locator.get()),
  );

  locator.registerLazySingleton<ICommentsRemoteDataSource>(
    () => CommentsRemoteDataSource(client: locator.get()),
  );

  // Repository
  locator.registerLazySingleton<IPostRepository>(
    () => PostRepositoryImpl(remoteDataSource: locator.get()),
  );

  locator.registerFactory<ICommentsRepository>(
      () => CommentRepositoryImpl(remoteDataSource: locator.get()));

  // Use case
  locator.registerFactory(() => GetPostUsecase(locator.get()));
  locator.registerFactory(() => GetCommentsUsecase(locator.get()));
}
