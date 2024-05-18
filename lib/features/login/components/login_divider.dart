import 'package:flutter/material.dart';
import 'package:loomi_test/support/style/app_colors.dart';
import 'package:loomi_test/support/style/app_fonts.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.lightGrey)),
        const SizedBox(width: 12),
        Text("ou entre com", style: AppFonts.montserratSemiBold(12, AppColors.darkGrey)),
        const SizedBox(width: 12),
        const Expanded(child: Divider(color: AppColors.lightGrey)),
      ],
    );
  }
}
