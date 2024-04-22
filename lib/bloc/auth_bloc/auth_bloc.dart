import 'package:bloc/bloc.dart';
import 'package:news_app/repositories/dto/sign_in_dto.dart';
import 'package:news_app/repositories/dto/sign_up_dto.dart';
import 'package:news_app/repositories/dto/user_article.dart';
import 'package:news_app/repositories/models/user_model.dart';
import 'package:news_app/repositories/news/users_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.userRepository) : super(AuthState(null)) {
    on<SignInEvent>(_signInEvent);
    on<SignUpEvent>(_signUpEvent);
    on<SetUserEvent>(_setUserEvent);
    on<CleanUserEvent>(_cleanUserEvent);
    on<AddUserArticle>(_addUserArticleEvent);
    on<RemoveUserArticle>(_removeUserArticleEvent);
    on<GetUserFromPrefs>(_getUserFromPrefsEvent);
  }

  final UserRepository userRepository;

  Future<void> setPrefsUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("userId", userId);
  }

  Future<void> removePrefsUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userId");
  }

  Future<int?> getPrefsUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("userId");
  }

  Future<void> _signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      final signInUser = await userRepository.signIn(event.signInDto);
      setPrefsUserId(signInUser.id);
      add(SetUserEvent(signInUser));
      event.navigate();
    } catch (e) {
      event.setMessage("Неверный логин или пароль");
    }
  }

  Future<void> _signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      final signUpUser = await userRepository.signUp(event.signUpDto);
      setPrefsUserId(signUpUser.id);
      add(SetUserEvent(signUpUser));
      event.navigate();
    } catch (e) {
      event.setError("Пользователь с таким логином уже существует");
    }
  }

  void _setUserEvent(SetUserEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(user: event.user));
  }

  void _cleanUserEvent(CleanUserEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(user: null));
  }

  Future<void> _addUserArticleEvent(
      AddUserArticle event, Emitter<AuthState> emit) async {
    try {
      var newUserArticle = await userRepository.createUserArticle(
          UserArticleCreateDto(state.user!.id, event.articleId));
      var newUser = UserModel(
          id: state.user!.id,
          name: state.user!.name,
          login: state.user!.login,
          user_articles: [...state.user!.user_articles, newUserArticle]);
      emit(state.copyWith(user: newUser));
    } finally {
      event.onFinish();
    }
  }

  Future<void> _removeUserArticleEvent(
      RemoveUserArticle event, Emitter<AuthState> emit) async {
    try {
      var userArticleId = state.user!.user_articles
          .firstWhere((a) => a.article_id == event.articleId);
      var _ = await userRepository.deleteUserArticle(userArticleId.id);
      var newUser = UserModel(
          id: state.user!.id,
          name: state.user!.name,
          login: state.user!.login,
          user_articles: state.user!.user_articles
              .where((article) => article.article_id != event.articleId)
              .toList());

      emit(state.copyWith(user: newUser));
    } finally {
      event.onFinish();
    }
  }

  Future<void> _getUserFromPrefsEvent(
      GetUserFromPrefs event, Emitter<AuthState> emit) async {
    var userId = await getPrefsUserId();
    if (userId == null) return;
    var user = await userRepository.getUser(userId);
    emit(state.copyWith(user: user));
  }
}
