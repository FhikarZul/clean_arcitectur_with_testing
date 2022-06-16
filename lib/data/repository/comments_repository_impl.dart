import 'package:clean_arcitectur_with_testing/data/datasource/comments_remote_data_source.dart';
import 'package:clean_arcitectur_with_testing/domain/model/domain_comments.dart';
import 'package:clean_arcitectur_with_testing/domain/repository/comments_respository.dart';
import 'package:dartz/dartz.dart';

class CommentRepositoryImpl extends ICommentsRepository {
  final ICommentsRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<String, List<DomainComments>>> getCommentList({
    required int idPost,
  }) async {
    try {
      final result = await remoteDataSource.getCommentsList(
        idPost: idPost.toString(),
      );

      final todoList = result.map((e) => e.toDomainModel()).toList();
      return Right(todoList);
    } catch (e) {
      return const Left('Failed to get post');
    }
  }
}
