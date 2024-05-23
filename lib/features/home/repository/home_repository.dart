import 'package:dio/dio.dart';
import 'package:loomi_test/support/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../models/bonus_model.dart';
import '../models/championship_model.dart';
import '../models/match_model.dart';
import '../models/tips_model.dart';
import '../models/won_bets_model.dart';

part 'home_repository.g.dart';

@RestApi(baseUrl: Constants.apiBaseUrl)
abstract interface class HomeRepository {
  factory HomeRepository(Dio dio, {String baseUrl}) = _HomeRepository;

  @GET("/championships?l=8&p={page}")
  Future<List<ChampionshipModel>> getChampionships(@Path('page') int page);

  @GET("/matches")
  Future<List<MatchModel>> getMatches();

  @GET("/tips?l=5&p={page}")
  Future<List<TipsModel>> getTips(@Path('page') int page);

  @GET("/bonus")
  Future<List<BonusModel>> getBonus();

  @GET("/won_bets?l=5&p={page}")
  Future<List<WonBetsModel>> getWonBets(@Path('page') int page);
}
