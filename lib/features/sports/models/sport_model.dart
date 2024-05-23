import 'package:json_annotation/json_annotation.dart';

part 'sport_model.g.dart';

@JsonSerializable()
class SportModel {
  SportModel({required this.name, required this.image, required this.id});

  final String name;
  final String image;
  final String id;

  factory SportModel.fromJson(Map<String, dynamic> json) => _$SportModelFromJson(json);

  Map<String, dynamic> toJson() => _$SportModelToJson(this);
}
