class UserModel {
  final String id;
  final String name;
  final String phone;
  final String address;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    switch (json) {
      case {
          'userId': final String id,
          'name': final String name,
          'phone': final String phone,
          'address': final String address,
        }:
        return UserModel(
          id: id,
          name: name,
          phone: phone,
          address: address,
        );
      case _:
        throw ArgumentError('Invalid JSON');
    }
  }
}
