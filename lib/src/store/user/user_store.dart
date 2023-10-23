import 'package:mobx/mobx.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../models/user_model.dart';
import '../../repositories/auth/auth_repository.dart';

part 'user_store.g.dart';

enum AuthStateStatus {
  initial,
  loading,
  success,
  error;
}

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final AuthRepository _authRepository;

  @readonly
  var _status = AuthStateStatus.initial;

  @readonly
  UserModel? _user;

  @readonly
  String? _errorMessage;

  UserStoreBase(this._authRepository);

  bool get isAuthenticated => _user != null;

  @action
  Future<void> logout() async {
    await _authRepository.logout();
    _user = null;
  }

  @action
  Future<void> login(String email, String password) async {
    try {
      _status = AuthStateStatus.loading;
      _user = await _authRepository.login(email, password);
      _status = AuthStateStatus.success;
    } on RepositoryException catch (e) {
      _errorMessage = e.message;
      _status = AuthStateStatus.error;
    }
  }

  @action
  Future<void> signup({
    required String name,
    required String phone,
    required String address,
    required String email,
    required String password,
  }) async {
    final userDto = (
      name: name,
      phone: phone,
      address: address,
      email: email,
      password: password,
    );

    try {
      _status = AuthStateStatus.loading;
      _user = await _authRepository.signup(userDto);
      _status = AuthStateStatus.success;
    } on RepositoryException catch (e) {
      _errorMessage = e.message;
      _status = AuthStateStatus.error;
    }
  }
}
