part of 'comments_list_bloc.dart';

abstract class CommentsListState extends Equatable {
  const CommentsListState();
}

class CommentsListInitial extends CommentsListState {
  @override
  List<Object?> get props => [];
}

class CommentsListLoading extends CommentsListState {
  @override
  List<Object?> get props => [];
}

class CommentsListHasData extends CommentsListState {
  final List<DomainComments> data;

  const CommentsListHasData({required this.data});

  @override
  List<Object?> get props => [data];
}

class CommentsListError extends CommentsListState {
  final String message;

  const CommentsListError(this.message);

  @override
  List<Object> get props => [message];
}
