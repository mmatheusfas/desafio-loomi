import 'package:loomi_test/features/sports/models/sport_model.dart';
import 'package:loomi_test/features/sports/repository/errors/sports_error.dart';
import 'package:loomi_test/features/sports/repository/sports_repository.dart';
import 'package:mobx/mobx.dart';

part 'sports_controller.g.dart';

class SportsController = SportsControllerBase with _$SportsController;

abstract class SportsControllerBase with Store {
  SportsControllerBase({required this.repository});

  final SportsRepository repository;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<SportModel> _sports = [];
  List<SportModel> get sports => _sports;

  @action
  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
  }

  @action
  void changeErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
  }

  Future<void> getAllSports() async {
    _changeIsLoading(isLoading: true);
    try {
      _sports = await repository.getAllSports().catchError(
        (_) {
          throw SportsError(errorMessage: "Erro ao buscar esportes...");
        },
      );
    } on SportsError catch (e) {
      changeErrorMessage(e.errorMessage);
    } catch (e) {
      changeErrorMessage("Algo inesperado aconteceu...");
    } finally {
      _changeIsLoading(isLoading: false);
    }
  }
}
