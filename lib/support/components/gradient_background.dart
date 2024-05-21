import 'package:flutter/material.dart';
import 'package:loomi_ui/loomi_ui.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            AppColors.lightYellow,
            AppColors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}
