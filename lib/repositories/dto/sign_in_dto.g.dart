// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInDto _$SignInDtoFromJson(Map<String, dynamic> json) => SignInDto(
      json['login'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$SignInDtoToJson(SignInDto instance) => <String, dynamic>{
      'password': instance.password,
      'login': instance.login,
    };
