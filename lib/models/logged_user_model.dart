import 'package:json_annotation/json_annotation.dart';

part 'logged_user_model.g.dart';

@JsonSerializable()
class LoggedUserModel {
  @JsonKey(name: 'auth_token')
  final String authToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  LoggedUserModel({
    required this.authToken,
    required this.refreshToken,
  });

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) => _$LoggedUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedUserModelToJson(this);
}
