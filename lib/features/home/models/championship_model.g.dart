// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionshipModel _$ChampionshipModelFromJson(Map<String, dynamic> json) =>
    ChampionshipModel(
      name: json['name'] as String,
      image: json['image'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ChampionshipModelToJson(ChampionshipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
