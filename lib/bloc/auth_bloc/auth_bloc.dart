import 'package:bloc/bloc.dart';
import 'package:news_app/repositories/dto/sign_in_dto.dart';
import 'package:news_app/repositories/dto/sign_up_dto.dart';
import 'package:news_app/repositories/models/user_model.dart';
import 'package:news_app/repositories/news/users_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.userRepository) : super(AuthState(null)) {
    on<SignInEvent>(_signInEvent);
    on<SignUpEvent>(_signUpEvent);
    on<SetUserEvent>(_setUserEvent);
  }

  final UserRepository userRepository;

  Future<void> _signInEvent(SignInEvent event, Emitter<AuthState> emit) async{
    final signInUser = await userRepository.signIn(event.signInDto);
    add(SetUserEvent(signInUser));
    event.navigate();
  }

  Future<void> _signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async{
    final signUpUser = await userRepository.signUp(event.signUpDto);
    add(SetUserEvent(signUpUser));
    event.navigate();

  }

  void _setUserEvent(SetUserEvent event, Emitter<AuthState> emit) {
     emit(state.copyWith(user: event.user));
  }

}
