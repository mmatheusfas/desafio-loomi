import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/features/sports/models/sport_model.dart';
import 'package:loomi_test/features/sports/repository/sports_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/sports_shared.dart';

class SportsRepositoryMock extends Mock implements SportsRepository {}

void main() {
  late SportsRepository repository;

  setUp(() {
    repository = SportsRepositoryMock();
  });

  group("Login", () {
    test("Test sports repository", () async {
      SportsShared.arrangeSportsRepositoryMock(repository);

      var result = await repository.getAllSports();

      expect(result, isA<List<SportModel>>());
      expect(result.length, 1);
      expect(result.first.name, "Teste 1");
    });
  });
}
