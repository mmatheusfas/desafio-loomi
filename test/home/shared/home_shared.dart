import 'package:loomi_test/features/home/models/bonus_model.dart';
import 'package:loomi_test/features/home/models/championship_model.dart';
import 'package:loomi_test/features/home/models/match_model.dart';
import 'package:loomi_test/features/home/models/tips_model.dart';
import 'package:loomi_test/features/home/models/won_bets_model.dart';
import 'package:loomi_test/features/home/repository/home_repository.dart';
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
      teamAScore: 10000,
      teamBScore: 10000,
      xbet: 10000,
      betsafe: 10000,
      betsson: 10000,
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
    ),
  ];

  static void arrangeChampionships(HomeRepository repository) {
    when(() => repository.getChampionships(1)).thenAnswer((_) async => Future.value(_mockedChampionships));
  }

  static void arrangeMatchs(HomeRepository repository) {
    when(() => repository.getMatches()).thenAnswer((_) async => Future.value(_mockedMatches));
  }

  static void arrangeTips(HomeRepository repository) {
    when(() => repository.getTips(1)).thenAnswer((_) async => Future.value(_mockedTips));
  }

  static void arrangeBonus(HomeRepository repository) {
    when(() => repository.getBonus()).thenAnswer((_) async => Future.value(_mockedBonus));
  }

  static void arrangeWonBets(HomeRepository repository) {
    when(() => repository.getWonBets(1)).thenAnswer((_) async => Future.value(_mockedWonBets));
  }
}
