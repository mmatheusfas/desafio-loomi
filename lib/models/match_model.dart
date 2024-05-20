import 'package:json_annotation/json_annotation.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel {
  final String id;
  final String date;
  @JsonKey(name: "team_a")
  final String teamA;
  @JsonKey(name: "team_b")
  final String teamB;
  @JsonKey(name: "team_a_image")
  final String teamAImage;
  @JsonKey(name: "team_b_image")
  final String teamBImage;
  @JsonKey(name: "team_a_score")
  final String teamAScore;
  @JsonKey(name: "team_b_score")
  final String teamBScore;
  @JsonKey(name: "1xbet_odds_avg")
  final String xbet;
  @JsonKey(name: "betsafe_odds_avg")
  final String betsafe;
  @JsonKey(name: "betsson_odds_avg")
  final String betsson;

  MatchModel({
    required this.id,
    required this.date,
    required this.teamA,
    required this.teamB,
    required this.teamAImage,
    required this.teamBImage,
    required this.teamAScore,
    required this.teamBScore,
    required this.xbet,
    required this.betsafe,
    required this.betsson,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}
