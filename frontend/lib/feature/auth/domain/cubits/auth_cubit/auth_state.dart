part of 'auth_cubit.dart';

abstract class AuthState {}

class CheckingAuthState extends AuthState {}

class NotLoggedIn extends AuthState {}

class LoggedIn extends AuthState {
  LoggedIn();
}
