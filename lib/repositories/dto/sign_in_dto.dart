
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_dto.g.dart';

@JsonSerializable()
class SignInDto{
  const SignInDto(this.password, this.login);

  factory SignInDto.fromJson(Map<String, dynamic> json) => _$SignInDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignInDtoToJson(this);


  final String password;
  final String login;


}