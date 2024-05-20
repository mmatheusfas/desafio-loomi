import 'package:json_annotation/json_annotation.dart';

part 'tips_model.g.dart';

@JsonSerializable()
class TipsModel {
  final String id;
  final String title;
  final String description;
  final String image;

  TipsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory TipsModel.fromJson(Map<String, dynamic> json) => _$TipsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TipsModelToJson(this);
}
