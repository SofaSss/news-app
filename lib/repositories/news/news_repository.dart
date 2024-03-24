import 'package:dio/dio.dart';
import 'package:news_app/repositories/models/news_t.dart';

class NewsRepository {
  
  Future<New> getNewsById(int id) async {
    final response =
        await Dio().get('https://api.spaceflightnewsapi.net/v4/articles/$id/');
    final data = response.data as Map<String, dynamic>;
    final newsById =  New.fromJson(data);
    return newsById;
  }

    Future<List<New>> getNewsList() async {
    final response =
        await Dio().get('https://api.spaceflightnewsapi.net/v4/articles');
    final data = response.data as Map<String, dynamic>;
    final newsList = (data['results'] as List) // мапа для превращения листа json в лист виджетов
        .map((element) => New.fromJson(element))
        .toList();
    return newsList;
  }
}

//future
//eventloop

