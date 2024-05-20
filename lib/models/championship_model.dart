import 'package:json_annotation/json_annotation.dart';

part 'championship_model.g.dart';

@JsonSerializable()
class ChampionshipModel {
  final String id;
  final String name;
  final String image;

  ChampionshipModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory ChampionshipModel.fromJson(Map<String, dynamic> json) => _$ChampionshipModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionshipModelToJson(this);
}
