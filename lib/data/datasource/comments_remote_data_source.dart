import 'dart:convert';

import 'package:clean_arcitectur_with_testing/data/model/comments_dto.dart';
import 'package:http/http.dart';

abstract class ICommentsRemoteDataSource {
  Future<List<CommentsDto>> getCommentsList({
    required String idPost,
  });
}

class CommentsRemoteDataSource extends ICommentsRemoteDataSource {
  final Client client;

  CommentsRemoteDataSource({required this.client});

  @override
  Future<List<CommentsDto>> getCommentsList({
    required String idPost,
  }) async {
    final result = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=' + idPost));

    if (result.statusCode == 200) {
      return List<CommentsDto>.from(
        jsonDecode(result.body).map(
          (e) => CommentsDto.fromJson(e),
        ),
      ).toList();
    } else {
      throw Exception('Failed to get comments');
    }
  }
}
