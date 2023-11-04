abstract interface class UserRepository {
  Future<void> updateUser(
    ({
      String userId,
      String name,
      String address,
      String phone,
    }) userData,
  );

  Future<void> changePassword(String newPassword);
}
