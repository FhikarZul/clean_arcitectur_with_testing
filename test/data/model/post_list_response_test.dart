import 'package:clean_arcitectur_with_testing/data/modal/post_list_response.dart';
import 'package:clean_arcitectur_with_testing/data/modal/post_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tPostResponse1 = PostResponse(
    userId: 1,
    id: 1,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
  );

  const tPostResponse2 = PostResponse(
    userId: 2,
    id: 2,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
  );

  const tPostListResponse1 = PostListResponse(post: [tPostResponse1]);
  const tPostListResponse2 = PostListResponse(post: [tPostResponse2]);

  test('should return true when equal', () {
    final result = tPostListResponse1 == tPostListResponse1;
    expect(result, true);
  });

  test('should return false when not equal', () {
    final result = tPostListResponse1 == tPostListResponse2;
    expect(result, false);
  });
}
