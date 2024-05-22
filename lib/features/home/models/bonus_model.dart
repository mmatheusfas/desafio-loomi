import 'package:json_annotation/json_annotation.dart';

part 'bonus_model.g.dart';

@JsonSerializable()
class BonusModel {
  final String id;
  final String platform;
  final String discount;

  BonusModel({
    required this.id,
    required this.platform,
    required this.discount,
  });

  factory BonusModel.fromJson(Map<String, dynamic> json) => _$BonusModelFromJson(json);

  Map<String, dynamic> toJson() => _$BonusModelToJson(this);
}
