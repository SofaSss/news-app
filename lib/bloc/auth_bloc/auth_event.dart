part of 'auth_bloc.dart';

sealed class AuthEvent {
}

class SetUserEvent extends AuthEvent{
  SetUserEvent(this.user);
  final UserModel user;
}

class CleanUserEvent extends AuthEvent{}

class SignInEvent extends AuthEvent{
  final SignInDto signInDto;
  final void Function() navigate;
  SignInEvent(this.signInDto, this.navigate);
}

class SignUpEvent extends AuthEvent{
  final SignUpDto signUpDto;
  final void Function() navigate;
  SignUpEvent(this.signUpDto, this.navigate);
}