import 'dart:convert';

import 'package:equatable/equatable.dart';

class LeaderboardUserModel extends Equatable {
  final String email;
  final String name;
  final int points;

  const LeaderboardUserModel({
    required this.email,
    required this.name,
    required this.points,
  });

  static const String _emailKey = 'email';
  static const String _nameKey = 'name';
  static const String _pointsKey = 'points';

  factory LeaderboardUserModel.fromJson(String json) =>
      LeaderboardUserModel.fromMap(jsonDecode(json));

  factory LeaderboardUserModel.fromMap(Map<String, dynamic> map) {
    return LeaderboardUserModel(
      email: map[_emailKey],
      name: map[_nameKey],
      points: map[_pointsKey],
    );
  }

  @override
  List<Object?> get props => [email, name, points];
}
