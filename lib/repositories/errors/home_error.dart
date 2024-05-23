class HomeError implements Exception {
  HomeError({required this.errorMessage});

  final String errorMessage;
}
