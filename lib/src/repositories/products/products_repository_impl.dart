import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../models/product_model.dart';
import '../../services/firebase_service.dart';
import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final FirebaseService _firebase;

  ProductsRepositoryImpl(this._firebase);

  @override
  Future<List<ProductModel>> getProducts(String category) async {
    final collection = _firebase.firestore.collection('products');
    late final QuerySnapshot<Map<String, dynamic>> snapshot;

    try {
      category == 'Todos'
          ? snapshot = await collection.orderBy('category').get()
          : snapshot =
              await collection.where('category', isEqualTo: category).get();

      final products = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();


      return products;
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao carregar cardápio');
    }
  }
}
