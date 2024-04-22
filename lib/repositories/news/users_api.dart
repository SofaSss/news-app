import 'package:dio/dio.dart';
import 'package:news_app/repositories/dto/sign_up_dto.dart';
import 'package:news_app/repositories/dto/user_article.dart';
import 'package:news_app/repositories/models/user_articles_model.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/sign_in_dto.dart';
import '../models/user_model.dart';

part 'users_api.g.dart';

@RestApi(baseUrl: 'https://api.pupupushka.ru/api')
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET('/users/{id}/')
  Future<UserModel> getUser(@Path('id') int id);

  @POST('/sign-up/')
  Future<UserModel> signUp(@Body() SignUpDto signUpDto);

  @POST('/sign-in/')
  Future<UserModel> signIn(@Body() SignInDto signIpDto);

  @POST('/user-articles/')
  Future<UserArticlesModel> createUserArticle(
      @Body() UserArticleCreateDto userArticleCreateDto);

  @DELETE('/user-articles/{id}/')
  Future<void> deleteUserArticle(@Path('id') int id);
}
