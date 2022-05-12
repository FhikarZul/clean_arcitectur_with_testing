import 'package:clean_arcitectur_with_testing/data/modal/post_response.dart';
import 'package:http/http.dart' as http;

import '../modal/post_list_response.dart';

abstract class PostRemoteDataSource {
  Future<List<PostResponse>> getPostList();
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl(this.client);

  @override
  Future<List<PostResponse>> getPostList() async {
    final result = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (result.statusCode == 200) {
      return PostListResponse.fromJson(result.body).post;
    } else {
      throw Exception('Failed to get post');
    }
  }
}
