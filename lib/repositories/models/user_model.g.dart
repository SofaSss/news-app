// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      login: json['login'] as String,
      user_articles: (json['user_articles'] as List<dynamic>)
          .map((e) => UserArticlesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'login': instance.login,
      'user_articles': instance.user_articles.map((e) => e.toJson()).toList(),
    };
