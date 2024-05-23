import 'package:flutter_test/flutter_test.dart';
import 'package:loomi_test/features/login/login_controller.dart';
import 'package:loomi_test/features/login/repository/login_repository.dart';
import 'package:loomi_test/services/local_storage/local_storage.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/login_shared.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class LocalStorageMock extends Mock implements LocalStorage {}

void main() {
  late LoginController sut;
  late LoginRepository repository;
  late LocalStorage localStorage;

  setUp(() {
    repository = LoginRepositoryMock();
    localStorage = LocalStorageMock();
    sut = LoginController(loginRepository: repository, localStorage: localStorage);
  });

  test("Test userLogin behavior", () async {
    when(() => localStorage.saveData("teste", "teste")).thenAnswer((_) async => Future.value());
    LoginShared.arrangeLoginRepositoryMock(repository);

    await sut.userLogin(email: "emailteste", password: "senhateste");

    verify(() => repository.login()).called(1);
    expect(sut.loggedUser.authToken, "teste auth");
    expect(sut.loggedUser.refreshToken, "teste refresh");
  });
}
