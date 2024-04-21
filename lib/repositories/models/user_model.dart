
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/repositories/models/user_articles_model.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel{

  @JsonSerializable(explicitToJson: true)

  const factory UserModel({
    required int id,
    required String name,
    required String login,
    required List<UserArticlesModel> user_articles,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}
