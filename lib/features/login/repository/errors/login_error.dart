class LoginError implements Exception {
  LoginError({required this.errorMessage});

  String errorMessage;
}
