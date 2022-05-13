import 'package:bloc_test/bloc_test.dart';
import 'package:clean_arcitectur_with_testing/domain/usecase/get_post_usecase.dart';
import 'package:clean_arcitectur_with_testing/presentation/bloc/post_list_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPost extends Mock implements GetPostUsecase {}

void main() {
  late MockGetPost mockGetPost;
  late PostListBloc postListBloc;

  setUp(() {
    mockGetPost = MockGetPost();
    postListBloc = PostListBloc(mockGetPost);
  });

  test('should start with PostListInitial state', () {
    expect(postListBloc.state, PostListInitial());
  });

  blocTest<PostListBloc, PostListState>(
    'shoudl emit [loading , has data] when usecase success',
    build: () => postListBloc,
    act: (bloc) {
      when(() => mockGetPost.execute()).thenAnswer((_) async => Right([]));
      bloc.add(PostListInit());
    },
    expect: () => <PostListState>[
      PostListLoading(),
      const PostListHasData([]),
    ],
    verify: (bloc) => verify(() => mockGetPost.execute()).called(1),
  );

  blocTest<PostListBloc, PostListState>(
    'should emit [loading, error] when usecase failed',
    build: () => postListBloc,
    act: (bloc) {
      when(() => mockGetPost.execute()).thenAnswer((_) async => Left('error'));
      bloc.add(PostListInit());
    },
    expect: () => <PostListState>[
      PostListLoading(),
      const PostListError('error'),
    ],
    verify: (bloc) => verify(() => mockGetPost.execute()).called(1),
  );
}
