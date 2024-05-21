import 'package:flutter/material.dart';
import 'package:loomi_test/features/login/login_steps/login_email_view.dart';
import 'package:loomi_test/features/login/login_steps/login_password_view.dart';
import 'package:loomi_test/features/login/login_view.dart';
import 'package:loomi_test/services/service_locator.dart';
import 'package:loomi_ui/loomi_ui.dart';

import 'features/tab_view/tab_view.dart';

void main() {
  setupServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppTheme.theme,
      routes: {
        '/': (_) => const LoginView(),
        '/login-email': (_) => const LoginEmailView(),
        '/login-password': (_) => const LoginPasswordView(),
        '/home': (_) => const TabView(),
      },
    );
  }
}
