import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/models/logged_user_model.dart';
import 'package:loomi_test/repositories/login/login_repository.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  late LoginRepository repository;

  LoggedUserModel mockedUserModel = LoggedUserModel(
    authToken: "teste auth",
    refreshToken: "teste refresh",
  );

  setUp(() {
    repository = LoginRepositoryMock();
  });

  group("Login", () {
    void arrangeLoginRepositoryMock() {
      when(() => repository.login()).thenAnswer((_) async => Future.value(mockedUserModel));
    }

    test("Test login", () async {
      arrangeLoginRepositoryMock();

      var result = await repository.login();

      expect(result.authToken, "teste auth");
      expect(result.refreshToken, "teste refresh");
    });
  });
}
