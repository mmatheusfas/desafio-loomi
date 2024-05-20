// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$_isEmailAtom =
      Atom(name: 'LoginControllerBase._isEmail', context: context);

  @override
  bool get _isEmail {
    _$_isEmailAtom.reportRead();
    return super._isEmail;
  }

  @override
  set _isEmail(bool value) {
    _$_isEmailAtom.reportWrite(value, super._isEmail, () {
      super._isEmail = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'LoginControllerBase._isLoading', context: context);

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

  late final _$_isPasswordObscureAtom =
      Atom(name: 'LoginControllerBase._isPasswordObscure', context: context);

  @override
  bool get _isPasswordObscure {
    _$_isPasswordObscureAtom.reportRead();
    return super._isPasswordObscure;
  }

  @override
  set _isPasswordObscure(bool value) {
    _$_isPasswordObscureAtom.reportWrite(value, super._isPasswordObscure, () {
      super._isPasswordObscure = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'LoginControllerBase._errorMessage', context: context);

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

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void changeIsPasswordObscure() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeIsPasswordObscure');
    try {
      return super.changeIsPasswordObscure();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsEmail() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeIsEmail');
    try {
      return super.changeIsEmail();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeIsLoading({required bool isLoading}) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase._changeIsLoading');
    try {
      return super._changeIsLoading(isLoading: isLoading);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String errorMessage) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeErrorMessage');
    try {
      return super.changeErrorMessage(errorMessage);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
