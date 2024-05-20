import 'package:dio/dio.dart';
import 'package:loomi_test/models/bonus_model.dart';
import 'package:loomi_test/models/championship_model.dart';
import 'package:loomi_test/models/match_model.dart';
import 'package:loomi_test/models/tips_model.dart';
import 'package:loomi_test/models/won_bets_model.dart';
import 'package:loomi_test/support/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'home_repository.g.dart';

@RestApi(baseUrl: Constants.apiBaseUrl)
abstract interface class HomeRepository {
  factory HomeRepository(Dio dio, {String baseUrl}) = _HomeRepository;

  @GET("/championships")
  Future<List<ChampionshipModel>> getChampionships();

  @GET("/matches")
  Future<List<MatchModel>> getMatches();

  @GET("/tips")
  Future<List<TipsModel>> getTips();

  @GET("/bonus")
  Future<List<BonusModel>> getBonus();

  @GET("/won_bets")
  Future<List<WonBetsModel>> getWonBets();
}
