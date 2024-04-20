// import 'package:dio/dio.dart';
// import 'package:news_app/repositories/models/news_model.dart';
// import 'package:news_app/resourses/app_const.dart';
// import 'package:retrofit/http.dart';
// import 'package:retrofit/retrofit.dart';
//
// part 'api.g.dart';
//
// @RestApi(baseUrl: 'https://api.spaceflightnewsapi.net/v4/')  //${Constants.baseUrl}
// abstract class NewsApiClient {
//   factory NewsApiClient(Dio dio, {String baseUrl}) = _NewsApiClient;
//
//   @GET('articles')
//   Future<NewsApiClientWrapper<NewsModel>> getNewsList({
//     @Query('offset') int offset = 0,
//     @Query('search') String search = '',
//   });
//
//   @GET('articles/{id}')
//   Future<NewsModel> getNewsById();
// }
//
// class NewsApiClientWrapper<T> {
//   final List<T> result;
//
//   NewsApiClientWrapper({required this.result});
//
//   factory NewsApiClientWrapper.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
//     return NewsApiClientWrapper(
//       result: (json['results'] as List<dynamic>).map((item) => fromJson(item)).toList(),
//     );
//   }
// }
//
//
//
