// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentController on PaymentControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'PaymentControllerBase._status', context: context);

  PaymentStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  PaymentStateStatus get _status => status;

  @override
  set _status(PaymentStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'PaymentControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$saveOrderAsyncAction =
      AsyncAction('PaymentControllerBase.saveOrder', context: context);

  @override
  Future<void> saveOrder(
      ({
        String deliveryAddress,
        List<CartItem> orderItems,
        double orderTotal,
        String paymentMethod,
        String userId
      }) orderDto) {
    return _$saveOrderAsyncAction.run(() => super.saveOrder(orderDto));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
