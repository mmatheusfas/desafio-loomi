import 'package:flutter/material.dart';
import 'package:loomi_test/features/login/login_steps/components/login_form_field.dart';
import 'package:loomi_test/support/utils/style/app_colors.dart';
import 'package:loomi_test/support/utils/style/app_fonts.dart';

import '../../../services/service_locator.dart';
import '../login_controller.dart';

class LoginEmailView extends StatelessWidget {
  const LoginEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailEC = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final LoginController controller = getIt.get();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64, bottom: 24, left: 24, right: 24),
        child: Form(
          key: formKey,
          child: LoginFormField(
            label: "Qual o seu e-mail?",
            textEditingController: emailEC,
            validator: controller.validateEmail,
            hintText: "E-mail",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pushNamed(context, '/login-password', arguments: emailEC.text);
              }
            },
            buttonChild: Text(
              "Continuar",
              style: AppFonts.montserratBold(12, AppColors.ultraDarkGrey),
            ),
          ),
        ),
      ),
    );
  }
}
