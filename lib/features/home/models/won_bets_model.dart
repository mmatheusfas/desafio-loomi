import 'package:json_annotation/json_annotation.dart';

part 'won_bets_model.g.dart';

@JsonSerializable()
class WonBetsModel {
  final String id;
  final String user;
  @JsonKey(name: "user_avatar")
  final String userAvatar;
  final String platform;
  final double score;

  WonBetsModel({
    required this.id,
    required this.user,
    required this.userAvatar,
    required this.platform,
    required this.score,
  });

  factory WonBetsModel.fromJson(Map<String, dynamic> json) => _$WonBetsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WonBetsModelToJson(this);
}
