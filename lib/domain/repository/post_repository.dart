import 'package:clean_arcitectur_with_testing/domain/model/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<String, List<Post>>> getPostList();
}
