import 'package:flutter/material.dart';

extension DialogExtensions on State {
  Future<void> showCustomDialog({required Widget dialog}) async {
    await showDialog(
      context: context,
      builder: (_) {
        return dialog;
      },
    );
  }
}
