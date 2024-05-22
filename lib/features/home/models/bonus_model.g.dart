// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusModel _$BonusModelFromJson(Map<String, dynamic> json) => BonusModel(
      id: json['id'] as String,
      platform: json['platform'] as String,
      discount: json['discount'] as String,
    );

Map<String, dynamic> _$BonusModelToJson(BonusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'discount': instance.discount,
    };
