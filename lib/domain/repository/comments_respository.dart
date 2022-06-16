import 'package:clean_arcitectur_with_testing/domain/model/domain_comments.dart';
import 'package:dartz/dartz.dart';

abstract class ICommentsRepository {
  Future<Either<String, List<DomainComments>>> getCommentList(
      {required int idPost});
}
