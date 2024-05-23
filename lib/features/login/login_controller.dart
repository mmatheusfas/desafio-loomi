import 'package:loomi_test/features/login/models/logged_user_model.dart';
import 'package:loomi_test/features/login/repository/errors/login_error.dart';
import 'package:loomi_test/features/login/repository/login_repository.dart';
import 'package:loomi_test/services/local_storage/local_storage.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  LoginControllerBase({
    required this.localStorage,
    required this.loginRepository,
  });

  final LoginRepository loginRepository;
  final LocalStorage localStorage;

  late LoggedUserModel loggedUser;

  @observable
  bool _isEmail = true;
  bool get isEmail => _isEmail;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  bool _isPasswordObscure = true;
  bool get isPasswordObscure => _isPasswordObscure;

  @observable
  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  @action
  void changeIsPasswordObscure() {
    _isPasswordObscure = !_isPasswordObscure;
  }

  @action
  void changeIsEmail() {
    _isEmail = !isEmail;
  }

  @action
  void _changeIsLoading({required bool isLoading}) {
    _isLoading = isLoading;
  }

  @action
  void changeErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty || value.length < 6) {
      return "Senha deve conter 6 caracteres";
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty || !value.trim().contains('@') || !value.trim().contains('.com')) {
      return "Digite um e-mail válido";
    }

    return null;
  }

  Future<void> userLogin({required String email, required String password}) async {
    _changeIsLoading(isLoading: true);

    try {
      loggedUser = await loginRepository.login().catchError(
        (e) {
          throw LoginError(errorMessage: "Erro ao fazer login..");
        },
      );
      _saveLocalUser(
        email: email,
        password: password,
        user: loggedUser,
      );
      changeErrorMessage('');
    } on LoginError catch (e) {
      changeErrorMessage(e.errorMessage);
    } catch (e) {
      changeErrorMessage("Algo inesperado aconteceu...");
    } finally {
      _changeIsLoading(isLoading: false);
    }
  }

  void _saveLocalUser({required String email, required String password, required LoggedUserModel user}) async {
    localStorage.saveData("user_email", email);
    localStorage.saveData("user_password", password);
    localStorage.saveData("auth_token", user.authToken);
    localStorage.saveData("refresh_token", user.refreshToken);
  }
}
