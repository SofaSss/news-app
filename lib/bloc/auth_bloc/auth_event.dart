part of 'auth_bloc.dart';

sealed class AuthEvent {}

class SetUserEvent extends AuthEvent {
  SetUserEvent(this.user);
  final UserModel user;
}

class CleanUserEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final SignInDto signInDto;
  final void Function() navigate;
  final void Function(String m) setMessage;
  SignInEvent(this.signInDto, this.navigate, this.setMessage);
}

class SignUpEvent extends AuthEvent {
  final SignUpDto signUpDto;
  final void Function() navigate;
  final void Function(String m) setError;
  SignUpEvent(this.signUpDto, this.navigate, this.setError);
}

class AddUserArticle extends AuthEvent {
  final int articleId;
  final void Function() onFinish;
  AddUserArticle(this.articleId, this.onFinish);
}

class RemoveUserArticle extends AuthEvent {
  final int articleId;
  final void Function() onFinish;
  RemoveUserArticle(this.articleId, this.onFinish);
}

class GetUserFromPrefs extends AuthEvent {}
