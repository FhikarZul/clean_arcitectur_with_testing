import 'package:clean_arcitectur_with_testing/domain/model/post.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/post_repository.dart';
import '../datasource/post_remote_data_source.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl(this.postRemoteDataSource);

  @override
  Future<Either<String, List<Post>>> getPostList() async {
    try {
      final result = await postRemoteDataSource.getPostList();
      final todoList = result.map((e) => e.toDomainModel()).toList();
      return Right(todoList);
    } catch (e) {
      return const Left('Failed to get post');
    }
  }
}
