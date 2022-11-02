import 'package:equatable/equatable.dart';

class LikeModel extends Equatable {
  final String id;
  final String userEmail;
  final String postId;

  const LikeModel({
    required this.id,
    required this.userEmail,
    required this.postId,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      id: json['id'],
      userEmail: json['userEmail'],
      postId: json['postId'],
    );
  }

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
