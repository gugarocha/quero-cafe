import '../../store/cart/cart_item.dart';

abstract interface class OrderRepository {
  Future<void> saveOrder(
    ({
      String userId,
      List<CartItem> orderItems,
      double orderTotal,
      String deliveryAddress,
      String paymentMethod,
    }) orderDto,
  );
}
