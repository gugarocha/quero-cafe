import '../models/user_model.dart';

abstract interface class AuthRepository {
  Future<UserModel> signup(
    ({
      String name,
      String phone,
      String address,
      String email,
      String password,
    }) userData,
  );

  Future<UserModel> login(String email, String password);

  Future<void> logout();
}
