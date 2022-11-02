import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String name;
  final int points;
  final String dob;
  final String doj;

  const UserModel({
    required this.email,
    required this.name,
    required this.points,
    required this.dob,
    required this.doj,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      points: json['points'],
      dob: json['dob'],
      doj: json['doj'],
    );
  }

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
