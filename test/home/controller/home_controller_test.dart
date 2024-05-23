import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/features/home/home_controller.dart';
import 'package:loomi_test/features/home/repository/home_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/home_shared.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeRepository repository;
  late HomeController sut;

  setUp(() {
    repository = HomeRepositoryMock();
    sut = HomeController(repository: repository);
  });

  group("Home Controller", () {
    test("Check initial values", () async {
      expect(sut.championships, isEmpty);
      expect(sut.tips, isEmpty);
      expect(sut.matches, isEmpty);
      expect(sut.bonus, isEmpty);
      expect(sut.wonBets, isEmpty);
    });

    test("Test getChampionships behavior", () async {
      HomeShared.arrangeChampionships(repository);

      expect(sut.championships, isEmpty);
      await sut.getChampionships();
      expect(sut.championships, isNotEmpty);
      expect(sut.championships[0].name, "Test Championship");
    });

    test("Test getMatches behavior", () async {
      HomeShared.arrangeMatchs(repository);

      expect(sut.matches, isEmpty);
      await sut.getMatches();
      expect(sut.matches, isNotEmpty);
      expect(sut.matches[0].teamA, "teamA");
    });

    test("Test getTips behavior", () async {
      HomeShared.arrangeTips(repository);

      expect(sut.tips, isEmpty);
      await sut.getTips();
      expect(sut.tips, isNotEmpty);
      expect(sut.tips[0].description, "Test 1");
    });

    test("Test getBonus behavior", () async {
      HomeShared.arrangeBonus(repository);

      expect(sut.bonus, isEmpty);
      await sut.getBonus();
      expect(sut.bonus, isNotEmpty);
      expect(sut.bonus[0].discount, "Test 1");
    });

    test("Test getWonBets behavior", () async {
      HomeShared.arrangeWonBets(repository);

      expect(sut.wonBets, isEmpty);
      await sut.getWonBets();
      expect(sut.wonBets, isNotEmpty);
      expect(sut.wonBets[0].platform, "Test 1");
    });
  });
}
