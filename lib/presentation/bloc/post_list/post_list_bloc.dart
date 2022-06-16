import 'package:bloc/bloc.dart';
import 'package:clean_arcitectur_with_testing/domain/model/domain_post.dart';
import 'package:clean_arcitectur_with_testing/domain/usecase/get_post_usecase.dart';
import 'package:equatable/equatable.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final GetPostUsecase getPostUsecase;

  PostListBloc({required this.getPostUsecase}) : super(PostListInitial()) {
    on<PostListEvent>((event, emit) async {
      emit(PostListLoading());

      final result = await getPostUsecase.execute();

      result.fold(
        (exception) => emit(PostListError(exception)),
        (data) => emit(PostListHasData(data)),
      );
    });
  }
}
