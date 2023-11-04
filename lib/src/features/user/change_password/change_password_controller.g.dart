// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordController on ChangePasswordControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ChangePasswordControllerBase._status', context: context);

  ChangePasswordStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ChangePasswordStateStatus get _status => status;

  @override
  set _status(ChangePasswordStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ChangePasswordControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$changePasswordAsyncAction = AsyncAction(
      'ChangePasswordControllerBase.changePassword',
      context: context);

  @override
  Future<void> changePassword(String oldPassword, String newPassword) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(oldPassword, newPassword));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
