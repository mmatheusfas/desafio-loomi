// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'won_bets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WonBetsModel _$WonBetsModelFromJson(Map<String, dynamic> json) => WonBetsModel(
      id: json['id'] as String,
      user: json['user'] as String,
      userAvatar: json['user_avatar'] as String,
      platform: json['platform'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$WonBetsModelToJson(WonBetsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'user_avatar': instance.userAvatar,
      'platform': instance.platform,
      'score': instance.score,
    };
