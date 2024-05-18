import 'package:flutter/material.dart';
import 'package:loomi_test/support/style/app_assets.dart';
import 'package:loomi_test/support/style/app_fonts.dart';

import '../../../support/style/app_colors.dart';

class LoginWelcomeCard extends StatelessWidget {
  const LoginWelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
            bottom: 65,
            left: 0,
            right: 0,
            child: Text(
              "Entre \nem sua conta",
              style: AppFonts.archivoNarrowSemiBold(24, AppColors.white),
            ),
          ),
          Positioned(
            bottom: 15,
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
