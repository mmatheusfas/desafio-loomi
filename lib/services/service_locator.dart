import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_test/features/login/login_controller.dart';
import 'package:loomi_test/repositories/login/login_repository.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<LoginRepository>(LoginRepository(getIt.get<Dio>()));
  getIt.registerSingleton<LoginController>(LoginController(loginRepository: getIt.get<LoginRepository>()));
}
