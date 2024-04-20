import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_app/repositories/models/news_model.dart';
import 'package:news_app/resourses/app_const.dart';

class NewsRepository {
  Future<NewsModel> getNewsById(int id) async {
    final response = await Dio().get('${Constants.baseUrl}articles/$id/');
    final data = response.data as Map<String, dynamic>;
    final newsById = NewsModel.fromJson(data);
    return newsById;
  }

  Future<List<NewsModel>> getNewsList({int offset = 0, String search = ''}) async {
    final response = await Dio().get('${Constants.baseUrl}articles/?limit=10&offset=$offset&search=$search');
    final data = response.data as Map<String, dynamic>;
    // мапа для превращения листа json в лист моделей
    final newsList = (data['results'] as List)
        .map((element) => NewsModel.fromJson(element))
        .toList();
    return newsList;
  }
}

