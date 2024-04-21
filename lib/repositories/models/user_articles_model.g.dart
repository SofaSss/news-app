// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_articles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserArticlesModelImpl _$$UserArticlesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserArticlesModelImpl(
      id: json['id'] as int,
      user: json['user'] as int,
      article_id: json['article_id'] as int,
    );

Map<String, dynamic> _$$UserArticlesModelImplToJson(
        _$UserArticlesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'article_id': instance.article_id,
    };
