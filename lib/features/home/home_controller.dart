import 'package:loomi_test/features/home/models/bonus_model.dart';
import 'package:loomi_test/features/home/models/match_model.dart';
import 'package:loomi_test/features/home/models/tips_model.dart';
import 'package:loomi_test/features/home/models/won_bets_model.dart';
import 'package:loomi_test/features/home/repository/errors/home_error.dart';
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

  @observable
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<ChampionshipModel> _championships = [];
  List<ChampionshipModel> get championships => _championships;

  List<MatchModel> _matches = [];
  List<MatchModel> get matches => _matches;

  List<TipsModel> _tips = [];
  List<TipsModel> get tips => _tips;

  List<BonusModel> _bonus = [];
  List<BonusModel> get bonus => _bonus;

  List<WonBetsModel> _wonBets = [];
  List<WonBetsModel> get wonBets => _wonBets;

  int _championshipPage = 1;
  int _tipsPage = 1;
  int _wonBetsPage = 1;

  @action
  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
  }

  @action
  void changeErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
  }

  void loadData() async {
    _changeIsLoading(isLoading: true);
    try {
      await getMatches();
      await getTips();
      await getChampionships();
      await getBonus();
      await getWonBets();
    } on HomeError catch (e) {
      changeErrorMessage(e.errorMessage);
    } catch (e) {
      changeErrorMessage("Algo inesperado aconteceu... Tente novamente");
    } finally {
      _changeIsLoading(isLoading: false);
    }
  }

  Future<void> _getMoreItems(Future<void> Function() fetchFunction) async {
    _changeIsLoading(isLoading: true);
    try {
      await fetchFunction();
    } on HomeError catch (e) {
      changeErrorMessage(e.errorMessage);
    } catch (e) {
      changeErrorMessage("Algo inesperado aconteceu... Tente novamente");
    } finally {
      _changeIsLoading(isLoading: false);
    }
  }

  void getMoreChampionships() async {
    _championshipPage++;
    _getMoreItems(getChampionships);
  }

  void getMoreTips() async {
    _tipsPage++;
    _getMoreItems(getTips);
  }

  void getMoreWonBets() async {
    _wonBetsPage++;
    _getMoreItems(getWonBets);
  }

  @action
  Future<void> getChampionships() async {
    try {
      _championships += await repository.getChampionships(_championshipPage).catchError(
            (_) => throw HomeError(errorMessage: "Erro ao buscar campeonatos..."),
          );
    } on HomeError catch (e) {
      throw HomeError(errorMessage: e.errorMessage);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getMatches() async {
    try {
      _matches = await repository.getMatches().catchError(
            (_) => throw HomeError(errorMessage: "Erro ao buscar partidas..."),
          );
    } on HomeError catch (e) {
      throw HomeError(errorMessage: e.errorMessage);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getTips() async {
    try {
      _tips += await repository.getTips(_tipsPage).catchError(
            (_) => throw HomeError(errorMessage: "Erro ao buscar dicas..."),
          );
    } on HomeError catch (e) {
      throw HomeError(errorMessage: e.errorMessage);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getBonus() async {
    try {
      _bonus = await repository.getBonus().catchError(
            (_) => throw HomeError(errorMessage: "Erro ao buscar bonus de aposta..."),
          );
    } on HomeError catch (e) {
      throw HomeError(errorMessage: e.errorMessage);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getWonBets() async {
    try {
      _wonBets += await repository.getWonBets(_wonBetsPage).catchError(
            (_) => throw HomeError(errorMessage: "Erro ao buscar apostas ganhas..."),
          );
    } on HomeError catch (e) {
      throw HomeError(errorMessage: e.errorMessage);
    } catch (e) {
      throw Exception();
    }
  }
}
