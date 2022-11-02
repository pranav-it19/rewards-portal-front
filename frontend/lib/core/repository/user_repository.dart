import 'package:rewards_portal/core/models/user_model.dart';
import 'package:rewards_portal/core/services/user_service.dart';

import '../locator.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();
  void clearUsers();
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.userService);

  final UserService userService;
  final List<UserModel> usersList = [];

  @override
  Future<List<UserModel>> getUsers() async {
    List<Map<String, dynamic>> response = await getIt<UserService>().getUsers();

    for (var userJson in response) {
      usersList.add(UserModel.fromJson(userJson));
    }

    return usersList;
  }

  @override
  void clearUsers() {
    usersList.clear();
  }
}
