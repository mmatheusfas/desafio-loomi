import 'package:dio/dio.dart';
import 'package:loomi_test/features/sports/models/sport_model.dart';
import 'package:loomi_test/support/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'sports_repository.g.dart';

@RestApi(baseUrl: Constants.apiBaseUrl)
abstract interface class SportsRepository {
  factory SportsRepository(Dio dio, {String baseUrl}) = _SportsRepository;

  @GET('/sports')
  Future<List<SportModel>> getAllSports();
}
