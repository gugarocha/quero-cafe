import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      final FirebaseAuth(:currentUser) = _firebase.auth;
      final AuthCredential credential = EmailAuthProvider.credential(
        email: currentUser?.email ?? '',
        password: oldPassword,
      );

      await currentUser?.reauthenticateWithCredential(credential);
      await currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-login-credentials':
          log('Senha antiga inválida', error: e);
          throw RepositoryException(
            message:
                'A senha antiga está incorreta. Confira a senha e tente novamente',
          );
        case _:
          log('Erro ao atualizar senha do usuário: ${e.code}', error: e);
          throw RepositoryException(
            message:
                'Ocorreu um erro ao atualizar sua senha. Tente novamente mais tarde!',
          );
      }
    } catch (e, s) {
      log('Erro ao atualizar senha do usuário: $e', error: e, stackTrace: s);
      throw RepositoryException(
        message:
            'Ocorreu um erro ao atualizar sua senha. Tente novamente mais tarde!',
      );
    }
  }
}
