import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/comments/domain/models/comment_model.dart';
import 'package:rewards_portal/feature/comments/domain/services/comment_service.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getComments(String postId);
  Future<bool> addComment(String postId, String comment);
  Future<bool> deleteComment({
    required String postId,
    required String commentId,
  });
}

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl(this.commentService);

  final CommentService commentService;

  @override
  Future<List<CommentModel>> getComments(String postId) async {
    List<Map<String, dynamic>> response =
        await getIt<CommentService>().getComments(postId);

    List<CommentModel> commentsList = [];
    for (var commentJson in response) {
      commentsList.add(CommentModel.fromJson(commentJson));
    }

    return commentsList.reversed.toList();
  }

  @override
  Future<bool> addComment(String postId, String comment) async {
    print('in repository');
    dynamic response =
        await getIt<CommentService>().addComment(postId, comment);
    if (response['status'] == 'OK') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    print('in repository');
    dynamic response = await getIt<CommentService>()
        .deleteComment(postId: postId, commentId: commentId);
    if (response['status'] == 'OK') {
      return true;
    } else {
      return false;
    }
  }
}
