import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final String id;
  final String authEmail;
  final String message;
  final String postId;

  const CommentModel({
    required this.id,
    required this.authEmail,
    required this.message,
    required this.postId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      authEmail: json['authorEmail'],
      message: json['message'],
      postId: json['postId'],
    );
  }

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
