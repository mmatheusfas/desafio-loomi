import 'package:flutter/material.dart';
import 'package:loomi_test/support/utils/app_assets.dart';
import 'package:loomi_ui/loomi_ui.dart';

class LoginWelcomeCard extends StatelessWidget {
  const LoginWelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(AppAssets.loginCover),
          fit: BoxFit.cover,
        ),
      ),
      height: 400,
      child: Stack(
        children: [
          Positioned(
            bottom: 75,
            child: Text(
              "Entre \nem sua conta",
              style: AppFonts.archivoNarrowSemiBold(24, AppColors.white),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Text(
              "Acompanhe seus jogos,\ncampeonatos e times favoritos",
              style: AppFonts.montserratRegular(14, AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
