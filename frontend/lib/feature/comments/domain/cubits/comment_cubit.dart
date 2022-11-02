import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/comments/domain/models/comment_model.dart';
import 'package:rewards_portal/feature/comments/domain/repository/comment_repository.dart';

import 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentState());

  Future<void> getComments(String postId, {bool toggle = true}) async {
    _toggleLoading(toggle);
    List<CommentModel> commentsList =
        await getIt<CommentRepository>().getComments(postId);
    emit(state.copyWith(commentsList: commentsList));
    _toggleLoading(false);
  }

  Future<void> createComments(String postId, String comment) async {
    // _toggleLoading(true);
    print('in cubit');
    bool commentsVal =
        await getIt<CommentRepository>().addComment(postId, comment);
    if (commentsVal) {
      getComments(postId, toggle: false);
    }
  }

  Future<void> deleteComment(String postId, String commentId) async {
    // _toggleLoading(true);
    print('in cubit');
    bool commentsList = await getIt<CommentRepository>()
        .deleteComment(commentId: commentId, postId: postId);
    if (commentsList) {
      getComments(postId, toggle: false);
    }
  }

  void _toggleLoading(bool isLoading) =>
      emit(state.copyWith(isLoading: isLoading));
}
