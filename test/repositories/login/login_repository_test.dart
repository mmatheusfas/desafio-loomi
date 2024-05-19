import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/repositories/login/login_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../shared/login_shared.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  late LoginRepository repository;

  setUp(() {
    repository = LoginRepositoryMock();
  });

  group("Login", () {
    test("Test login repository", () async {
      LoginShared.arrangeLoginRepositoryMock(repository);

      var result = await repository.login();

      expect(result.authToken, "teste auth");
      expect(result.refreshToken, "teste refresh");
    });
  });
}
