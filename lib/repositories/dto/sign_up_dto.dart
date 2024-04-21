
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_dto.g.dart';

@JsonSerializable()
class SignUpDto{
  const SignUpDto(this.password, this.login, this.name);

  factory SignUpDto.fromJson(Map<String, dynamic> json) => _$SignUpDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpDtoToJson(this);

  final String password;
  final String login;
  final String name;


}