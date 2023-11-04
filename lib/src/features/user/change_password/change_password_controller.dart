import 'package:mobx/mobx.dart';

import '../../../core/exceptions/repository_exception.dart';
import '../../../repositories/user/user_repository.dart';

part 'change_password_controller.g.dart';

enum ChangePasswordStateStatus {
  initial,
  loading,
  success,
  error;
}

class ChangePasswordController = ChangePasswordControllerBase
    with _$ChangePasswordController;

abstract class ChangePasswordControllerBase with Store {
  final UserRepository _repository;

  @readonly
  var _status = ChangePasswordStateStatus.initial;

  @readonly
  String? _errorMessage;

  ChangePasswordControllerBase(this._repository);

  @action
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      _status = ChangePasswordStateStatus.loading;
      await _repository.changePassword(oldPassword, newPassword);
      _status = ChangePasswordStateStatus.success;
    } on RepositoryException catch (e) {
      _errorMessage = e.message;
      _status = ChangePasswordStateStatus.error;
    }
  }
}
