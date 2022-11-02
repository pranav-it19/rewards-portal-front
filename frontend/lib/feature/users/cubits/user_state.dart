import 'package:rewards_portal/core/models/user_model.dart';

class UserState {
  final List<UserModel> usersList;

  UserState({
    this.usersList = const [],
  });

  UserState copyWith({
    final List<UserModel>? usersList,
  }) {
    return UserState(
      usersList: usersList ?? this.usersList,
    );
  }
}
