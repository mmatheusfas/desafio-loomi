import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/features/sports/repository/sports_repository.dart';
import 'package:loomi_test/features/sports/sports_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/sports_shared.dart';

class SportsRepositoryMock extends Mock implements SportsRepository {}

void main() {
  late SportsController sut;
  late SportsRepository repository;

  setUp(() {
    repository = SportsRepositoryMock();
    sut = SportsController(repository: repository);
  });

  test("Test getAllSports behavior", () async {
    SportsShared.arrangeSportsRepositoryMock(repository);

    await sut.getAllSports();

    verify(() => sut.getAllSports()).called(1);
    expect(sut.sports.length, 1);
    expect(sut.sports.first.name, "Teste 1");
  });
}
