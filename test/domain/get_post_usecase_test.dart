import 'package:clean_arcitectur_with_testing/domain/model/post.dart';
import 'package:clean_arcitectur_with_testing/domain/repository/post_repository.dart';
import 'package:clean_arcitectur_with_testing/domain/usecase/get_post_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockPostRepository;
  late GetPostUsecase getPostUsecase;

  setUp(() {
    mockPostRepository = MockPostRepository();
    getPostUsecase = GetPostUsecase(mockPostRepository);
  });

  test('should return a list of todos on success', () async {
    when(() => mockPostRepository.getPostList())
        .thenAnswer((_) async => const Right([
              Post(
                  title:
                      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                  body:
                      "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto")
            ]));
    final result = await getPostUsecase.execute();

    result.fold(
      (msg) => fail('should not received data'),
      (data) => expect(data, [
        const Post(
            title:
                "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            body:
                "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto")
      ]),
    );
  });

  test('should return error message on failure', () async {
    when((() => mockPostRepository.getPostList()))
        .thenAnswer((_) async => const Left('error'));
    final result = await getPostUsecase.execute();

    result.fold(
      (msg) => expect(msg, 'error'),
      (data) => fail('should not received data'),
    );
  });
}
