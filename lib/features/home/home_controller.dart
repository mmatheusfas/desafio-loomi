import 'package:loomi_test/features/home/models/bonus_model.dart';
import 'package:loomi_test/features/home/models/match_model.dart';
import 'package:loomi_test/features/home/models/tips_model.dart';
import 'package:loomi_test/features/home/models/won_bets_model.dart';
import 'package:loomi_test/repositories/errors/home_error.dart';
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

  List<ChampionshipModel> championships = [];
  List<MatchModel> matches = [];
  List<TipsModel> tips = [];
  List<BonusModel> bonus = [];
  List<WonBetsModel> wonBets = [];

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
    } catch (e) {
      throw Exception(e.toString());
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
      championships += await repository.getChampionships(_championshipPage).catchError(
        (_) {
          throw HomeError(errorMessage: "Erro ao buscar campeonatos...");
        },
      );
    } catch (_) {
      throw Exception();
    }
  }

  Future<void> getMatches() async {
    try {
      matches = await repository.getMatches().catchError(
        (_) {
          throw HomeError(errorMessage: "Erro ao buscar partidas...");
        },
      );
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getTips() async {
    try {
      tips += await repository.getTips(_tipsPage).catchError(
        (_) {
          throw HomeError(errorMessage: "Erro ao buscar dicas...");
        },
      );
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getBonus() async {
    try {
      bonus = await repository.getBonus().catchError(
        (_) {
          throw HomeError(errorMessage: "Erro ao buscar bonus de aposta...");
        },
      );
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> getWonBets() async {
    try {
      wonBets += await repository.getWonBets(_wonBetsPage).catchError(
        (_) {
          throw HomeError(errorMessage: "Erro ao buscar apostas ganhas...");
        },
      );
    } catch (e) {
      throw Exception();
    }
  }
}
