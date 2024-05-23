// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SportsController on SportsControllerBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: 'SportsControllerBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'SportsControllerBase._errorMessage', context: context);

  @override
  String get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$SportsControllerBaseActionController =
      ActionController(name: 'SportsControllerBase', context: context);

  @override
  void _changeIsLoading({required bool isLoading}) {
    final _$actionInfo = _$SportsControllerBaseActionController.startAction(
        name: 'SportsControllerBase._changeIsLoading');
    try {
      return super._changeIsLoading(isLoading: isLoading);
    } finally {
      _$SportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String errorMessage) {
    final _$actionInfo = _$SportsControllerBaseActionController.startAction(
        name: 'SportsControllerBase.changeErrorMessage');
    try {
      return super.changeErrorMessage(errorMessage);
    } finally {
      _$SportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
