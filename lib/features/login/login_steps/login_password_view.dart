import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_test/features/login/login_controller.dart';
import 'package:loomi_test/services/service_locator.dart';
import 'package:loomi_test/support/style/app_colors.dart';
import 'package:loomi_test/support/style/app_fonts.dart';

import 'components/login_form_field.dart';

class LoginPasswordView extends StatelessWidget {
  const LoginPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = getIt.get();
    final passwordEC = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final userEmail = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64, bottom: 24, left: 24, right: 24),
        child: Form(
          key: formKey,
          child: Observer(
            builder: (_) {
              return LoginFormField(
                label: "Qual sua senha?",
                textEditingController: passwordEC,
                validator: controller.validatePassword,
                hintText: "Senha",
                obscureText: controller.isPasswordObscure,
                suffixIcon: IconButton(
                  onPressed: controller.changeisPasswordObscure,
                  icon: const Icon(Icons.remove_red_eye),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.userLogin(email: userEmail, password: passwordEC.text);
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                buttonChild: controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Text(
                        "Continuar",
                        style: AppFonts.montserratBold(12, AppColors.ultraDarkGrey),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
