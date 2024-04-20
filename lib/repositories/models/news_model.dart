// NewsModel
import 'package:freezed_annotation/freezed_annotation.dart';


part 'news_model.g.dart';
part 'news_model.freezed.dart';

@Freezed()
class NewsModel with _$NewsModel{

  @JsonSerializable(explicitToJson: true)

  const factory NewsModel({
    required int id,
    required String title,
    required String image_url,
    required String url,
    required String summary,
  }) = _NewsModel;


  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);




}
