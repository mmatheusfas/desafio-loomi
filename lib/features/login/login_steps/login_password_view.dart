import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_test/features/login/login_controller.dart';
import 'package:loomi_test/services/service_locator.dart';
import 'package:loomi_test/support/extensions/dialog_extensions.dart';
import 'package:loomi_ui/loomi_ui.dart';

import '../../../support/components/error_alert.dart';
import 'components/login_form_field.dart';

class LoginPasswordView extends StatefulWidget {
  const LoginPasswordView({super.key});

  @override
  State<LoginPasswordView> createState() => _LoginPasswordViewState();
}

class _LoginPasswordViewState extends State<LoginPasswordView> {
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
              if (controller.errorMessage.isNotEmpty && controller.isLoading == false) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showCustomDialog(
                    dialog: ErrorAlert(
                      errorMessage: controller.errorMessage,
                      onPressed: () {
                        controller.changeErrorMessage('');
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                    ),
                  );
                });
              }

              return LoginFormField(
                label: "Qual sua senha?",
                textEditingController: passwordEC,
                validator: controller.validatePassword,
                hintText: "Senha",
                obscureText: controller.isPasswordObscure,
                suffixIcon: IconButton(
                  onPressed: controller.changeIsPasswordObscure,
                  icon: const Icon(Icons.remove_red_eye),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final nav = Navigator.of(context);

                    await controller.userLogin(email: userEmail, password: passwordEC.text);

                    if (controller.errorMessage.isEmpty) nav.pushReplacementNamed('/home');
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
