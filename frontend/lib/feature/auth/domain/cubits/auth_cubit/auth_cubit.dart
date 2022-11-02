import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/core/locator.dart';
import 'package:rewards_portal/feature/auth/domain/constants/auth_constants.dart';
import 'package:rewards_portal/feature/auth/domain/services/auth_service.dart';

part 'auth_state.dart';

/// Must call `init()` to initialize the cubit before using
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(CheckingAuthState());

  void init() async {
    bool isLoggedIn = await getIt<AuthService>().isLoggedIn();
    if (isLoggedIn) {
      emit(LoggedIn());
    } else {
      emit(NotLoggedIn());
    }
  }

  Future<bool> checkForSuccess(Uri? uri, BuildContext context) async {
    if (uri.toString().startsWith(AuthConstants.redirectUrl)) {
      final queryParams = _getQueryParamsFromFragmentUri(uri!);
      final accessToken = queryParams['access_token'];
      if (accessToken != null) {
        bool isLoggedIn =
            await getIt<AuthService>().loginWithAccessToken(accessToken);
        if (isLoggedIn) emit(LoggedIn());
        return isLoggedIn;
      } else {
        debugPrint('Access Token is missing in query params');
      }
      return false;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await getIt<AuthService>().logOut();
    emit(CheckingAuthState());
    init();
  }

  Map<String, String> _getQueryParamsFromFragmentUri(Uri uri) {
    final newUri = Uri.parse(uri.toString().replaceAll('#', '?'));
    return newUri.queryParameters;
  }
}
