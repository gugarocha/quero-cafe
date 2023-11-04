// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$_statusAtom =
      Atom(name: 'UserStoreBase._status', context: context);

  AuthStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  AuthStateStatus get _status => status;

  @override
  set _status(AuthStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_userAtom = Atom(name: 'UserStoreBase._user', context: context);

  UserModel? get user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  UserModel? get _user => user;

  @override
  set _user(UserModel? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'UserStoreBase._errorMessage', context: context);

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

  late final _$logoutAsyncAction =
      AsyncAction('UserStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$loginAsyncAction =
      AsyncAction('UserStoreBase.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$signupAsyncAction =
      AsyncAction('UserStoreBase.signup', context: context);

  @override
  Future<void> signup(
      {required String name,
      required String phone,
      required String address,
      required String email,
      required String password}) {
    return _$signupAsyncAction.run(() => super.signup(
        name: name,
        phone: phone,
        address: address,
        email: email,
        password: password));
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  void updateUser(({String address, String name, String phone}) userData) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.updateUser');
    try {
      return super.updateUser(userData);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
