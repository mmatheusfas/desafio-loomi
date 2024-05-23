import 'package:loomi_test/features/login/models/logged_user_model.dart';
import 'package:loomi_test/features/login/repository/login_repository.dart';
import 'package:mocktail/mocktail.dart';

class LoginShared {
  LoginShared._();

  static final mockedUserModel = LoggedUserModel(
    authToken: "teste auth",
    refreshToken: "teste refresh",
  );

  static void arrangeLoginRepositoryMock(LoginRepository repository) {
    when(() => repository.login()).thenAnswer((_) async => Future.value(mockedUserModel));
  }
}
