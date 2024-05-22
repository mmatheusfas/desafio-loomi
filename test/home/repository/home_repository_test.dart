import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/features/home/models/bonus_model.dart';
import 'package:loomi_test/features/home/models/championship_model.dart';
import 'package:loomi_test/features/home/models/match_model.dart';
import 'package:loomi_test/features/home/models/tips_model.dart';
import 'package:loomi_test/features/home/models/won_bets_model.dart';
import 'package:loomi_test/features/home/repository/home_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/home_shared.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeRepository repository;

  setUp(() {
    repository = HomeRepositoryMock();
  });

  group(
    "Home repository",
    () {
      test("Test getChampionships", () async {
        HomeShared.arrangeChampionships(repository);

        final result = await repository.getChampionships();

        verify(() => repository.getChampionships()).called(1);
        expect(result, isA<List<ChampionshipModel>>());
        expect(result.length, 1);
        expect(result[0].id, "1");
      });

      test("Test getMatches", () async {
        HomeShared.arrangeMatchs(repository);

        final result = await repository.getMatches();

        verify(() => repository.getMatches()).called(1);
        expect(result, isA<List<MatchModel>>());
        expect(result.length, 1);
        expect(result[0].id, "1");
      });

      test("Test getTips", () async {
        HomeShared.arrangeTips(repository);

        final result = await repository.getTips();

        verify(() => repository.getTips()).called(1);
        expect(result, isA<List<TipsModel>>());
        expect(result.length, 1);
        expect(result[0].id, "1");
      });

      test("Test getBonus", () async {
        HomeShared.arrangeBonus(repository);

        final result = await repository.getBonus();

        verify(() => repository.getBonus()).called(1);
        expect(result, isA<List<BonusModel>>());
        expect(result.length, 1);
        expect(result[0].id, "1");
      });

      test("Test getWonBets", () async {
        HomeShared.arrangeWonBets(repository);

        final result = await repository.getWonBets();

        verify(() => repository.getWonBets()).called(1);
        expect(result, isA<List<WonBetsModel>>());
        expect(result.length, 1);
        expect(result[0].id, "1");
      });
    },
  );
}
