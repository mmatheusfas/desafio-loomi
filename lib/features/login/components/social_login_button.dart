import 'package:flutter/material.dart';
import 'package:loomi_ui/loomi_ui.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
    required this.textColor,
    required this.iconPath,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      iconAlignment: IconAlignment.start,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconPath),
          const Spacer(),
          Text(
            text,
            style: AppFonts.montserratSemiBold(12, textColor),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
