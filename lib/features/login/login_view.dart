import 'package:flutter/material.dart';
import 'package:loomi_test/features/login/components/login_divider.dart';
import 'package:loomi_test/features/login/components/social_login_button.dart';
import 'package:loomi_test/support/style/app_assets.dart';
import 'package:loomi_test/support/style/app_colors.dart';
import 'package:loomi_test/support/style/app_fonts.dart';

import 'components/login_welcome_card.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LoginWelcomeCard(),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    SocialLoginButton(
                      iconPath: AppAssets.icGoogle,
                      textColor: Colors.black,
                      backgroundColor: AppColors.lightGrey,
                      text: "Entrar com Google",
                      icon: Icons.telegram,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    SocialLoginButton(
                      iconPath: AppAssets.icApple,
                      textColor: AppColors.white,
                      backgroundColor: AppColors.black,
                      text: "Entrar com Apple",
                      icon: Icons.telegram,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 40),
                    const LoginDivider(),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 56),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login-email');
                            },
                            child: Text(
                              'Email',
                              style: AppFonts.montserratSemiBold(12, AppColors.darkGrey),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.yellow,
                              minimumSize: const Size(100, 56),
                            ),
                            child: Text(
                              'Telefone',
                              style: AppFonts.montserratSemiBold(12, AppColors.ultraDarkGrey),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}