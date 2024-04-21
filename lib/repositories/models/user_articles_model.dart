
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_articles_model.g.dart';
part 'user_articles_model.freezed.dart';

@freezed
class UserArticlesModel with _$UserArticlesModel{

  @JsonSerializable(explicitToJson: true)

  const factory UserArticlesModel({
    required int id,
    required int user,
    required int article_id,
  }) = _UserArticlesModel;

  factory UserArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$UserArticlesModelFromJson(json);

}
