part of 'auth_bloc.dart';

class AuthState {
  AuthState(this.user);

  final UserModel? user;

  AuthState copyWith({
    UserModel? user,
  }) {
    return AuthState(user);
  }
}
