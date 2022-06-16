import 'dart:convert';

import 'package:clean_arcitectur_with_testing/data/model/post_dto.dart';
import 'package:http/http.dart';

abstract class IPostRemoteDataSource {
  Future<List<PostDto>> getPostList();
}

class PostRemoteDataSourceImpl extends IPostRemoteDataSource {
  final Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostDto>> getPostList() async {
    final result = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (result.statusCode == 200) {
      return List<PostDto>.from(
        jsonDecode(result.body).map(
          (e) => PostDto.fromJson(e),
        ),
      ).toList();
    } else {
      throw Exception('Failed to get post');
    }
  }
}
