import 'package:flutter/material.dart';
import 'package:loomi_test/support/utils/style/app_colors.dart';
import 'package:loomi_test/support/utils/style/app_fonts.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.lightGrey, thickness: 1.5)),
        const SizedBox(width: 20),
        Text("ou entre com", style: AppFonts.montserratSemiBold(12, AppColors.darkGrey)),
        const SizedBox(width: 20),
        const Expanded(child: Divider(color: AppColors.lightGrey, thickness: 1.5)),
      ],
    );
  }
}
