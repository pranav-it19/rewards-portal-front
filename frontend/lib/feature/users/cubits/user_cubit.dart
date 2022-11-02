import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/core/models/user_model.dart';
import 'package:rewards_portal/core/repository/user_repository.dart';
import 'package:rewards_portal/feature/users/cubits/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  Future<void> getUsers() async {
    List<UserModel> usersList = await getIt<UserRepository>().getUsers();
    emit(state.copyWith(usersList: usersList));
  }
}
