import 'package:loomi_test/features/sports/models/sport_model.dart';
import 'package:loomi_test/features/sports/repository/sports_repository.dart';
import 'package:mocktail/mocktail.dart';

class SportsShared {
  SportsShared._();

  static final mockedSports = [
    SportModel(name: "Teste 1", image: "Teste 1", id: "1"),
  ];

  static void arrangeSportsRepositoryMock(SportsRepository repository) {
    when(() => repository.getAllSports()).thenAnswer((_) async => Future.value(mockedSports));
  }
}
