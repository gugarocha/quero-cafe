import 'package:mobx/mobx.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../repositories/order/order_repository.dart';
import '../../store/cart/cart_item.dart';

part 'payment_controller.g.dart';

enum PaymentStateStatus {
  initial,
  loading,
  success,
  error;
}

class PaymentController = PaymentControllerBase with _$PaymentController;

abstract class PaymentControllerBase with Store {
  final OrderRepository _orderRepository;

  @readonly
  var _status = PaymentStateStatus.initial;

  @readonly
  String? _errorMessage;

  PaymentControllerBase(this._orderRepository);

  @action
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
      _status = PaymentStateStatus.loading;
      await _orderRepository.saveOrder(orderDto);
      _status = PaymentStateStatus.success;
    } on RepositoryException catch (e) {
      _errorMessage = e.message;
      _status = PaymentStateStatus.error;
    }
  }
}
