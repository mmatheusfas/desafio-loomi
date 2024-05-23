import 'package:flutter/material.dart';
import 'package:loomi_ui/loomi_ui.dart';

class DefaultLoader extends StatelessWidget {
  const DefaultLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.yellow,
      ),
    );
  }
}
