import 'package:bloc/bloc.dart';
import 'package:clean_arcitectur_with_testing/domain/model/domain_comments.dart';
import 'package:clean_arcitectur_with_testing/domain/usecase/get_comments_usecase.dart';
import 'package:equatable/equatable.dart';

part 'comments_list_event.dart';
part 'comments_list_state.dart';

class CommentsListBloc extends Bloc<CommentsListEvent, CommentsListState> {
  final GetCommentsUsecase getCommentsUsecase;

  CommentsListBloc({required this.getCommentsUsecase})
      : super(CommentsListInitial()) {
    on<GetCommentListEvent>((event, emit) async {
      emit(CommentsListLoading());

      final result = await getCommentsUsecase.execute(idPost: event.idPost);

      result.fold(
        (exception) => emit(CommentsListError(exception)),
        (data) => emit(CommentsListHasData(data: data)),
      );
    });
  }
}
