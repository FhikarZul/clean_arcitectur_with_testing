import 'package:clean_arcitectur_with_testing/data/datasource/post_remote_data_source.dart';
import 'package:clean_arcitectur_with_testing/data/modal/post_list_response.dart';
import 'package:clean_arcitectur_with_testing/data/modal/post_response.dart';
import 'package:clean_arcitectur_with_testing/data/repository/post_repository_impl.dart';
import 'package:clean_arcitectur_with_testing/domain/repository/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements PostRemoteDataSource {}

late PostRemoteDataSource mockPostRemoteDataSource;
late PostRepository postRepository;

void main() {
  setUp(() {
    mockPostRemoteDataSource = MockRemoteDataSource();
    postRepository = PostRepositoryImpl(mockPostRemoteDataSource);
  });

  const tPostResponse = PostResponse(
    userId: 1,
    id: 1,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
  );

  const tPostListResponse = PostListResponse(post: [tPostResponse]);

  test('should return a list of todo when remote call is successful', () async {
    when(() => mockPostRemoteDataSource.getPostList())
        .thenAnswer((_) async => tPostListResponse.post);

    final result = await postRepository.getPostList();
    final expectation =
        tPostListResponse.post.map((e) => e.toDomainModel()).toList();

    expect(result.getOrElse(() => []), expectation);
  });

  test("shoudl return a list of todo when remote call is failied", () async {
    when(() => mockPostRemoteDataSource.getPostList())
        .thenThrow(Exception('Failed to get post'));

    final result = await postRepository.getPostList();
    result.fold((l) => expect(l, 'Failed to get post'),
        (r) => fail('no data received'));
  });
}
