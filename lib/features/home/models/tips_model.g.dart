// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipsModel _$TipsModelFromJson(Map<String, dynamic> json) => TipsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TipsModelToJson(TipsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
