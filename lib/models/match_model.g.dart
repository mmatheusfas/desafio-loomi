// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      id: json['id'] as String,
      date: json['date'] as String,
      teamA: json['team_a'] as String,
      teamB: json['team_b'] as String,
      teamAImage: json['team_a_image'] as String,
      teamBImage: json['team_b_image'] as String,
      teamAScore: json['team_a_score'] as String,
      teamBScore: json['team_b_score'] as String,
      xbet: json['1xbet_odds_avg'] as String,
      betsafe: json['betsafe_odds_avg'] as String,
      betsson: json['betsson_odds_avg'] as String,
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'team_a': instance.teamA,
      'team_b': instance.teamB,
      'team_a_image': instance.teamAImage,
      'team_b_image': instance.teamBImage,
      'team_a_score': instance.teamAScore,
      'team_b_score': instance.teamBScore,
      '1xbet_odds_avg': instance.xbet,
      'betsafe_odds_avg': instance.betsafe,
      'betsson_odds_avg': instance.betsson,
    };
