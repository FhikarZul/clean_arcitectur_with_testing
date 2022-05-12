import 'package:clean_arcitectur_with_testing/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../model/post.dart';

class GetPostUsecase {
  final PostRepository postRepository;

  const GetPostUsecase(this.postRepository);

  Future<Either<String, List<Post>>> execute() {
    return postRepository.getPostList();
  }
}
