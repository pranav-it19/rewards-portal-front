import 'package:equatable/equatable.dart';
import 'package:rewards_portal/feature/comments/domain/models/comment_model.dart';
import 'package:rewards_portal/feature/likes/domain/models/like_model.dart';

class FeedModel extends Equatable {
  final String id;
  final String createdAt;
  final String tagId;
  final String message;
  final String authorEmail;
  final String authorName;
  final String mentionedUserEmail;
  final String mentionedUserName;
  final String initial;
  final String? imageUrl;
  final int likesCount;
  final int commentsCount;
  final bool isLiked;
  final List<LikeModel> likesList;
  final List<CommentModel> commentsList;

  const FeedModel({
    required this.id,
    required this.createdAt,
    required this.tagId,
    required this.message,
    required this.authorEmail,
    required this.authorName,
    required this.mentionedUserEmail,
    required this.mentionedUserName,
    required this.initial,
    required this.imageUrl,
    required this.likesCount,
    required this.commentsCount,
    required this.isLiked,
    required this.likesList,
    required this.commentsList,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    final likes = _getLikes(
      (json['likes'] as List).map((e) => e as Map<String, dynamic>).toList(),
    );
    final comments = _getComments(
      (json['comments'] as List).map((e) => e as Map<String, dynamic>).toList(),
    );

    return FeedModel(
      id: json['id'],
      createdAt: json['createdAt'],
      tagId: json['tagId'],
      message: json['message'],
      authorEmail: json['authorEmail'],
      mentionedUserEmail: json['mentionedUserEmail'],
      authorName: json['author']['name'],
      mentionedUserName: json['mentionedUser']['name'],
      initial: _getUserInitial(json['author']['name']),
      imageUrl: json['imageURL'] ?? 'https://picsum.photos/seed/picsum/300/200',
      likesCount: likes.length,
      commentsCount: comments.length,
      isLiked: json['isLiked'] ?? false,
      likesList: likes,
      commentsList: comments,
    );
  }

  copyWith({
    String? id,
    String? createdAt,
    String? tagId,
    String? message,
    String? authorEmail,
    String? authorName,
    String? mentionedUserEmail,
    String? mentionedUserName,
    String? initial,
    String? imageUrl,
    int? likesCount,
    int? commentsCount,
    bool? isLiked,
    List<LikeModel>? likesList,
    List<CommentModel>? commentsList,
  }) {
    return FeedModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      tagId: tagId ?? this.tagId,
      message: message ?? this.message,
      authorEmail: authorEmail ?? this.authorEmail,
      authorName: authorName ?? this.authorName,
      mentionedUserEmail: mentionedUserEmail ?? this.mentionedUserEmail,
      mentionedUserName: mentionedUserName ?? this.mentionedUserName,
      initial: initial ?? this.initial,
      imageUrl: imageUrl ?? this.imageUrl,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLiked: isLiked ?? this.isLiked,
      likesList: likesList ?? this.likesList,
      commentsList: commentsList ?? this.commentsList,
    );
  }

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;

  static String _getUserInitial(String fullName) {
    String initial = '';
    List<String> nameList = fullName.split(' ');
    if (nameList.length >= 2) {
      initial = '${nameList[0].substring(0, 1)}${nameList[1].substring(0, 1)}';
    } else if (nameList.length == 1) {
      initial = nameList[0].substring(0, 1);
    }

    return initial;
  }

  static List<LikeModel> _getLikes(List<Map<String, dynamic>> likesJson) {
    List<LikeModel> likes = [];
    for (var likeJson in likesJson) {
      likes.add(LikeModel.fromJson(likeJson));
    }
    return likes;
  }

  static List<CommentModel> _getComments(
      List<Map<String, dynamic>> commentsJson) {
    List<CommentModel> comments = [];
    for (var commentJson in commentsJson) {
      comments.add(CommentModel.fromJson(commentJson));
    }
    return comments;
  }
}
