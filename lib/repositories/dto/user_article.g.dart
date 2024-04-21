// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserArticleCreateDto _$UserArticleCreateDtoFromJson(
        Map<String, dynamic> json) =>
    UserArticleCreateDto(
      json['user'] as int,
      json['article_id'] as int,
    );

Map<String, dynamic> _$UserArticleCreateDtoToJson(
        UserArticleCreateDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'article_id': instance.article_id,
    };
