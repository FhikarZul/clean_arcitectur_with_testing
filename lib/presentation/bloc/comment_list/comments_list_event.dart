part of 'comments_list_bloc.dart';

abstract class CommentsListEvent extends Equatable {
  const CommentsListEvent();
}

class GetCommentListEvent extends CommentsListEvent {
  final int idPost;

  const GetCommentListEvent({required this.idPost});

  @override
  List<Object?> get props => [idPost];
}
