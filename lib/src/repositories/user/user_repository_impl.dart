import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../services/firebase_service.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseService _firebase;

  UserRepositoryImpl(this._firebase);

  @override
  Future<void> updateUser(userData) async {
    try {
      await _firebase.firestore.collection('users').doc(userData.userId).set(
        {
          'name': userData.name,
          'address': userData.address,
          'phone': userData.phone,
        },
        SetOptions(merge: true),
      );
    } catch (e, s) {
      log('Erro ao editar dados do usuário: $e', error: e, stackTrace: s);
      throw RepositoryException(
        message: 'Erro ao salvar dados do usuário. Tente novamente mais tarde!',
      );
    }
  }

  @override
  Future<void> changePassword(String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
