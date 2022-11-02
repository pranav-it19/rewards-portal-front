import 'package:equatable/equatable.dart';

class TagModel extends Equatable {
  final String id;
  final String name;

  const TagModel({
    required this.id,
    required this.name,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
