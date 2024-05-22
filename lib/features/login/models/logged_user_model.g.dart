// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUserModel _$LoggedUserModelFromJson(Map<String, dynamic> json) =>
    LoggedUserModel(
      authToken: json['auth_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$LoggedUserModelToJson(LoggedUserModel instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken,
      'refresh_token': instance.refreshToken,
    };
