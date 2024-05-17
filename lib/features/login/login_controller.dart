import 'package:loomi_test/models/logged_user_model.dart';
import 'package:loomi_test/repositories/login/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  LoginController({required this.loginRepository});

  final LoginRepository loginRepository;

  late LoggedUserModel loggedUser;

  Future<void> userLogin({required String email, required String password}) async {
    try {
      loggedUser = await loginRepository.login();
    } catch (e) {
      throw Exception();
    }
  }

  void saveLocalUser({required String email, required String password, required LoggedUserModel user}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("user_email", email);
    sp.setString("user_password", password);
    sp.setString("auth_token", user.authToken);
    sp.setString("refresh_token", user.refreshToken);
  }
}
