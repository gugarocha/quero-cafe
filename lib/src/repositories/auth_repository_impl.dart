import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../core/exceptions/repository_exception.dart';
import '../models/user_model.dart';
import '../services/firebase_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseService _firebase;

  AuthRepositoryImpl(this._firebase);

  @override
  Future<UserModel> signup(userData) async {
    try {
      final UserCredential(:user) =
          await _firebase.auth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      final data = {
        'userId': user?.uid,
        'name': userData.name,
        'phone': userData.phone,
        'address': userData.address,
      };

      await _firebase.firestore.collection('users').doc(user?.uid).set(data);

      return UserModel.fromMap(data);
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case 'email-already-in-use':
          log('O e-mail informado já está cadastrado', error: e, stackTrace: s);
          throw RepositoryException(
            message: 'O e-mail informado já está cadastrado!',
          );
        case _:
          log('Erro com o servidor', error: e, stackTrace: s);
          throw RepositoryException(message: 'Erro com o servidor');
      }
    } catch (e, s) {
      log('Erro ao realizar Cadastro', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar cadastro');
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final userCredential = await _firebase.auth
          .signInWithEmailAndPassword(email: email, password: password);

      final snapshot = await _firebase.firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      final userData = snapshot.data();

      return UserModel.fromMap(userData ?? {});
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case 'invalid-login-credentials':
          log(
            'E-mail ou senha inválidos. Verifique e tente novamente',
            error: e,
            stackTrace: s,
          );
          throw RepositoryException(
            message: 'E-mail ou senha inválidos. Verifique e tente novamente',
          );
        case _:
          log('Erro com o servidor', error: e, stackTrace: s);
          throw RepositoryException(message: 'Erro com o servidor');
      }
    } catch (e, s) {
      log('Erro ao realizar Login', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar Login');
    }
  }

  @override
  Future<void> logout() async {
    await _firebase.auth.signOut();
  }
}
