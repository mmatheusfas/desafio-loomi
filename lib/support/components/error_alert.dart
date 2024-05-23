import 'package:flutter/material.dart';
import 'package:loomi_ui/loomi_ui.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          const Icon(Icons.error_outline),
          Text(errorMessage),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightGrey,
          ),
          child: const Text("Ok"),
        )
      ],
    );
  }
}
