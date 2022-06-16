import 'package:clean_arcitectur_with_testing/injection.dart';
import 'package:clean_arcitectur_with_testing/presentation/bloc/comment_list/comments_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPage extends StatelessWidget {
  final int idPost;
  const CommentsPage({Key? key, required this.idPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentsListBloc>(
      create: (context) => CommentsListBloc(getCommentsUsecase: locator.get())
        ..add(GetCommentListEvent(idPost: idPost)),
      child: const CommentScreen(),
    );
  }
}

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments List'),
      ),
      body: BlocBuilder<CommentsListBloc, CommentsListState>(
        builder: (context, state) {
          if (state is CommentsListInitial) {
            return const Center();
          }

          if (state is CommentsListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CommentsListError) {
            return Center(child: Text(state.message));
          }

          if (state is CommentsListHasData) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final item = state.data[index];

                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.body),
                    ),
                  );
                });
          }

          return const Center(child: Text('Illegal State'));
        },
      ),
    );
  }
}
