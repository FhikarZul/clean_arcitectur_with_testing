import 'package:bloc_test/bloc_test.dart';
import 'package:clean_arcitectur_with_testing/domain/model/post.dart';
import 'package:clean_arcitectur_with_testing/presentation/bloc/post_list_bloc.dart';
import 'package:clean_arcitectur_with_testing/presentation/page/post_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockPostListBloc extends MockBloc<PostListEvent, PostListState>
    implements PostListBloc {}

void main() {
  late PostListBloc postListBloc;
  setUp(() {
    postListBloc = MockPostListBloc();
  });

  tearDown(() {
    postListBloc.close();
  });

  Widget _testableWidget() {
    return BlocProvider.value(
      value: postListBloc,
      child: const MaterialApp(
        home: PostListScreen(),
      ),
    );
  }

  testWidgets('should display a list of todos when fetching successful',
      (WidgetTester tester) async {
    const initialState = PostListHasData([
      Post(
        title:
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        body:
            "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
      )
    ]);

    whenListen<PostListState>(
      postListBloc,
      Stream.fromIterable([initialState]),
      initialState: initialState,
    );

    await tester.pumpWidget(_testableWidget());

    final finder = find.byType(ListView);

    expect(finder, findsOneWidget);
  });

  testWidgets('should display an error message when fetching failed',
      (WidgetTester tester) async {
    const initialState = PostListError('error');

    whenListen<PostListState>(
      postListBloc,
      Stream.fromIterable([initialState]),
      initialState: initialState,
    );

    await tester.pumpWidget(_testableWidget());

    final finder = find.byType(Center);
    final textMatcher = find.text('error');

    expect(finder, findsOneWidget);
    expect(textMatcher, findsOneWidget);
  });
}
