import 'package:loomi_test/models/bonus_model.dart';
import 'package:loomi_test/models/championship_model.dart';
import 'package:loomi_test/models/match_model.dart';
import 'package:loomi_test/models/tips_model.dart';
import 'package:loomi_test/models/won_bets_model.dart';
import 'package:loomi_test/repositories/home/home_repository.dart';
import 'package:mocktail/mocktail.dart';

class HomeShared {
  HomeShared._();

  static final _mockedChampionships = [
    ChampionshipModel(
      name: "Test Championship",
      image: "test image",
      id: "1",
    ),
  ];

  static final _mockedMatches = [
    MatchModel(
      id: "1",
      date: "date",
      teamA: "teamA",
      teamB: "teamB",
      teamAImage: "teamAImage",
      teamBImage: "teamBImage",
      teamAScore: "teamAScore",
      teamBScore: "teamBScore",
      xbet: "xbet",
      betsafe: "betsafe",
      betsson: "betsson",
    ),
  ];

  static final _mockedTips = [
    TipsModel(
      id: "1",
      title: "Test 1",
      description: "Test 1",
      image: "Test 1",
    ),
  ];

  static final _mockedBonus = [
    BonusModel(
      id: "1",
      platform: "Test 1",
      discount: "Test 1",
    )
  ];

  static final _mockedWonBets = [
    WonBetsModel(
      id: "1",
      user: "Test 1",
      userAvatar: "Test 1",
      platform: "Test 1",
      score: 200.00,
    )
  ];

  static void arrangeChampionships(HomeRepository repository) {
    when(() => repository.getChampionships()).thenAnswer((_) async => Future.value(_mockedChampionships));
  }

  static void arrangeMatchs(HomeRepository repository) {
    when(() => repository.getMatches()).thenAnswer((_) async => Future.value(_mockedMatches));
  }

  static void arrangeTips(HomeRepository repository) {
    when(() => repository.getTips()).thenAnswer((_) async => Future.value(_mockedTips));
  }

  static void arrangeBonus(HomeRepository repository) {
    when(() => repository.getBonus()).thenAnswer((_) async => Future.value(_mockedBonus));
  }

  static void arrangeWonBets(HomeRepository repository) {
    when(() => repository.getWonBets()).thenAnswer((_) async => Future.value(_mockedWonBets));
  }
}
