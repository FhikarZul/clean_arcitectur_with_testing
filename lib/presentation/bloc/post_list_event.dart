part of 'post_list_bloc.dart';

abstract class PostListEvent extends Equatable {
  const PostListEvent();
}

class PostListInit extends PostListEvent {
  @override
  List<Object?> get props => [];
}
