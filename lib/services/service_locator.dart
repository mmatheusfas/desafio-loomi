import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<Dio>(Dio());
}
