// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpDto _$SignUpDtoFromJson(Map<String, dynamic> json) => SignUpDto(
      json['password'] as String,
      json['login'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$SignUpDtoToJson(SignUpDto instance) => <String, dynamic>{
      'password': instance.password,
      'login': instance.login,
      'name': instance.name,
    };
