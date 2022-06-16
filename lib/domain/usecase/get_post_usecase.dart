import 'package:clean_arcitectur_with_testing/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../model/domain_post.dart';

class GetPostUsecase {
  final IPostRepository respository;

  const GetPostUsecase(this.respository);

  Future<Either<String, List<DomainPost>>> execute() {
    return respository.getPostList();
  }
}
