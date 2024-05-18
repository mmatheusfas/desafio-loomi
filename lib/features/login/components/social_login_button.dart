import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final VoidCallback onPressed;
  final String iconPath;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
    required this.textColor,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
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
              style: TextStyle(color: textColor, fontSize: 12),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
