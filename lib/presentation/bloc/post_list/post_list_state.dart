part of 'post_list_bloc.dart';

abstract class PostListState extends Equatable {
  const PostListState();
}

class PostListInitial extends PostListState {
  @override
  List<Object> get props => [];
}

class PostListLoading extends PostListState {
  @override
  List<Object> get props => [];
}

class PostListHasData extends PostListState {
  final List<DomainPost> data;

  const PostListHasData(this.data);

  @override
  List<Object> get props => [data];
}

class PostListError extends PostListState {
  final String message;

  const PostListError(this.message);

  @override
  List<Object> get props => [message];
}
