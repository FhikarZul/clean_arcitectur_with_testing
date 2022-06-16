import 'package:clean_arcitectur_with_testing/domain/model/domain_post.dart';
import 'package:dartz/dartz.dart';

abstract class IPostRepository {
  Future<Either<String, List<DomainPost>>> getPostList();
}
