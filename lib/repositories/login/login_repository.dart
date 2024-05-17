import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/logged_user_model.dart';

part 'login_repository.g.dart';

@RestApi(baseUrl: "https://6569cc7dde53105b0dd7af5c.mockapi.io")
abstract interface class LoginRepository {
  factory LoginRepository(Dio dio, {String baseUrl}) = _LoginRepository;

  @POST("/login")
  Future<LoggedUserModel> login();
}
