import 'package:dio/dio.dart';
import 'package:loomi_test/support/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../models/logged_user_model.dart';

part 'login_repository.g.dart';

@RestApi(baseUrl: Constants.apiBaseUrl)
abstract interface class LoginRepository {
  factory LoginRepository(Dio dio, {String baseUrl}) = _LoginRepository;

  @POST("/login")
  Future<LoggedUserModel> login();
}
