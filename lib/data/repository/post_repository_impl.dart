import 'package:clean_arcitectur_with_testing/domain/model/domain_post.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/post_repository.dart';
import '../datasource/post_remote_data_source.dart';

class PostRepositoryImpl extends IPostRepository {
  final IPostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<DomainPost>>> getPostList() async {
    try {
      final result = await remoteDataSource.getPostList();
      final todoList = result.map((e) => e.toDomainModel()).toList();
      return Right(todoList);
    } catch (e) {
      return const Left('Failed to get post');
    }
  }
}
