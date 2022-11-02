import 'package:rewards_portal/feature/comments/domain/models/comment_model.dart';

class CommentState {
  final List<CommentModel> commentsList;
  final bool isLoading;

  CommentState({
    this.commentsList = const [],
    this.isLoading = false,
  });

  CommentState copyWith({
    final List<CommentModel>? commentsList,
    final bool? isLoading,
  }) {
    return CommentState(
      commentsList: commentsList ?? this.commentsList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
