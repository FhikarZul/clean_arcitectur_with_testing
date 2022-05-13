import 'package:clean_arcitectur_with_testing/data/datasource/post_remote_data_source.dart';
import 'package:clean_arcitectur_with_testing/data/modal/post_list_response.dart';
import 'package:clean_arcitectur_with_testing/data/modal/post_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late http.Client mockClient;
  late PostRemoteDataSource postRemoteDataSource;

  const tPostResponse = PostResponse(
    userId: 1,
    id: 1,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
  );

  const tPostListResponse = PostListResponse(post: [tPostResponse]);
  const tJson =
      '[{"userId": 1,"id": 1, "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "body": "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"}]';

  setUp(() {
    mockClient = MockHttpClient();
    postRemoteDataSource = PostRemoteDataSourceImpl(mockClient);
  });

  test('should return a list of post response when network code is 200',
      () async {
    when(() => mockClient
            .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
        .thenAnswer((_) async => http.Response(tJson, 200));

    final result = await postRemoteDataSource.getPostList();

    expect(result, tPostListResponse.post);
  });

  test('should throw an exception when network code is not 200', () {
    when(() => mockClient
            .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')))
        .thenAnswer((_) async => http.Response('Not connected', 404));

    final call = postRemoteDataSource.getPostList();

    expect(() => call, throwsException);
  });
}
