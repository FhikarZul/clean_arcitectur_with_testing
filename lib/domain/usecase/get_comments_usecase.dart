import 'package:clean_arcitectur_with_testing/domain/model/domain_comments.dart';
import 'package:clean_arcitectur_with_testing/domain/repository/comments_respository.dart';
import 'package:dartz/dartz.dart';

class GetCommentsUsecase {
  final ICommentsRepository respository;

  const GetCommentsUsecase(this.respository);

  Future<Either<String, List<DomainComments>>> execute({required int idPost}) {
    return respository.getCommentList(idPost: idPost);
  }
}
