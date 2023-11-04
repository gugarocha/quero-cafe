import 'package:mobx/mobx.dart';

import '../../../core/exceptions/repository_exception.dart';
import '../../../repositories/user/user_repository.dart';
import '../../../store/user/user_store.dart';

part 'user_edit_controller.g.dart';

enum UserEditStateStatus {
  initial,
  loading,
  success,
  error,
}

class UserEditController = UserEditControllerBase with _$UserEditController;

abstract class UserEditControllerBase with Store {
  final UserRepository _repository;
  final UserStore _userStore;

  @readonly
  var _status = UserEditStateStatus.initial;

  @readonly
  String? _errorMessage;

  UserEditControllerBase(this._repository, this._userStore);

  @action
  Future<void> editUser(
    ({
      String userId,
      String name,
      String address,
      String phone,
    }) userData,
  ) async {
    try {
      _status = UserEditStateStatus.loading;

      await _repository.updateUser(userData);
      _userStore.updateUser(
        (
          name: userData.name,
          address: userData.address,
          phone: userData.phone,
        ),
      );

      _status = UserEditStateStatus.success;
    } on RepositoryException catch (e) {
      _errorMessage = e.message;
      _status = UserEditStateStatus.error;
    }
  }
}
