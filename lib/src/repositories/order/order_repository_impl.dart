import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../services/firebase_service.dart';
import '../../store/cart/cart_item.dart';
import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseService _firebase;

  OrderRepositoryImpl(this._firebase);

  @override
  Future<void> saveOrder(
    ({
      String userId,
      List<CartItem> orderItems,
      double orderTotal,
      String deliveryAddress,
      String paymentMethod,
    }) orderDto,
  ) async {
    try {
      final controllDocument =
          _firebase.firestore.collection('controll').doc('orders');
      await controllDocument.update({'orderNumber': FieldValue.increment(1)});
      final controllSnapshot = await controllDocument.get();
      final orderNumber = controllSnapshot.data()!['orderNumber'];

      final orderItems = orderDto.orderItems
          .map(
            (item) => {
              'productId': item.product.id,
              'price': item.product.price,
              'amount': item.amount,
            },
          )
          .toList();

      await _firebase.firestore.collection('orders').add({
        'orderNumber': orderNumber,
        'userId': orderDto.userId,
        'datetime': DateTime.now(),
        'orderItems': orderItems,
        'orderTotal': orderDto.orderTotal,
        'deliveryAddress': orderDto.deliveryAddress,
        'paymentMethod': orderDto.paymentMethod,
      });
    } catch (e, s) {
      log('Erro ao salvar pedido: $e', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao finalizar o pedido');
    }
  }
}
