import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/features/login/login_controller.dart';
import 'package:loomi_test/features/login/repository/login_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/login_shared.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  late LoginController sut;
  late LoginRepository repository;

  setUp(() {
    repository = LoginRepositoryMock();
    sut = LoginController(loginRepository: repository);
  });

  test("Test userLogin behavior", () async {
    LoginShared.arrangeLoginRepositoryMock(repository);
    await sut.userLogin(email: "emailteste", password: "senhateste");

    verify(() => repository.login()).called(1);
    expect(sut.loggedUser.authToken, "teste auth");
    expect(sut.loggedUser.refreshToken, "teste refresh");
  });
}
