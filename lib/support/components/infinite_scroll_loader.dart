import 'package:flutter/material.dart';
import 'package:loomi_ui/loomi_ui.dart';

class InfiniteScrollLoader extends StatelessWidget {
  const InfiniteScrollLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 10,
      bottom: 0,
      top: 0,
      child: SizedBox(
        height: 32,
        width: 32,
        child: CircleAvatar(
          backgroundColor: AppColors.yellow,
          child: SizedBox(
            height: 12,
            width: 12,
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
