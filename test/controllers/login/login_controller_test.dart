import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/features/login/login_controller.dart';
import 'package:loomi_test/models/logged_user_model.dart';
import 'package:loomi_test/repositories/login/login_repository.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  late LoginController sut;
  late LoginRepository repository;

  LoggedUserModel mockedUserModel = LoggedUserModel(
    authToken: "teste auth",
    refreshToken: "teste refresh",
  );

  setUp(() {
    repository = LoginRepositoryMock();
    sut = LoginController(loginRepository: repository);
  });

  group("Test Login Controller", () {
    void arrangeLoginRepositoryMock() {
      when(() => repository.login()).thenAnswer((_) async => Future.value(mockedUserModel));
    }

    test("Test userLogin behavior", () async {
      arrangeLoginRepositoryMock();

      await sut.userLogin(email: "emailteste", password: "senhateste");

      verify(() => repository.login()).called(1);
      expect(sut.loggedUser.authToken, "teste auth");
      expect(sut.loggedUser.refreshToken, "teste refresh");
    });
  });
}
