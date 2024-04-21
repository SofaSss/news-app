

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_article.g.dart';

@JsonSerializable()
class UserArticleCreateDto{
  const UserArticleCreateDto(this.user, this.article_id);

  factory UserArticleCreateDto.fromJson(Map<String, dynamic> json) => _$UserArticleCreateDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserArticleCreateDtoToJson(this);


  final int user;
  final int article_id;


}