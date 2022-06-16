import 'package:clean_arcitectur_with_testing/injection.dart';
import 'package:clean_arcitectur_with_testing/presentation/page/comments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_list/post_list_bloc.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostListBloc>(
      create: (context) => PostListBloc(getPostUsecase: locator.get())
        ..add(
          PostListInit(),
        ),
      child: const PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post list'),
      ),
      body: BlocBuilder<PostListBloc, PostListState>(
        builder: (context, state) {
          if (state is PostListInitial) {
            return const Center();
          }

          if (state is PostListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PostListError) {
            return Center(child: Text(state.message));
          }

          if (state is PostListHasData) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];
                return Card(
                  child: InkWell(
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.body),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentsPage(
                            idPost: item.id,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }

          return const Center(child: Text('Illegal State'));
        },
      ),
    );
  }
}
