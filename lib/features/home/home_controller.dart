import 'package:loomi_test/features/home/models/bonus_model.dart';
import 'package:loomi_test/features/home/models/match_model.dart';
import 'package:loomi_test/features/home/models/tips_model.dart';
import 'package:loomi_test/features/home/models/won_bets_model.dart';
import 'package:mobx/mobx.dart';

import 'models/championship_model.dart';
import 'repository/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase({required this.repository});

  final HomeRepository repository;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ChampionshipModel> championships = [];
  List<MatchModel> matches = [];
  List<TipsModel> tips = [];
  List<BonusModel> bonus = [];
  List<WonBetsModel> wonBets = [];

  @action
  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
  }

  void loadData() async {
    _changeIsLoading(isLoading: true);
    try {
      await getMatches();
      await getTips();
      await getChampionships();
      await getBonus();
      await getWonBets();
      _changeIsLoading(isLoading: false);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getChampionships() async {
    try {
      championships = await repository.getChampionships();
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getMatches() async {
    try {
      matches = await repository.getMatches();
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getTips() async {
    try {
      tips = await repository.getTips();
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getBonus() async {
    try {
      bonus = await repository.getBonus();
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getWonBets() async {
    try {
      wonBets = await repository.getWonBets();
    } catch (e) {
      throw Exception();
    }
  }
}
