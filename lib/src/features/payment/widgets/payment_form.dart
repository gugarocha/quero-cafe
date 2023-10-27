import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/helpers/formatter_extensions.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../store/cart/cart_store.dart';
import '../../../store/user/user_store.dart';
import '../payment_controller.dart';
import '../payment_page.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> with Loader, Messages {
  final formKey = GlobalKey<FormState>();
  final addressEC = TextEditingController();

  bool? useMyAddress = true;
  PaymentsEnum payment = PaymentsEnum.money;

  final cartStore = Modular.get<CartStore>();
  final user = Modular.get<UserStore>().user;

  final controller = Modular.get<PaymentController>();

  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case PaymentStateStatus.initial:
            break;
          case PaymentStateStatus.loading:
            showLoader();
            break;
          case PaymentStateStatus.success:
            hideLoader();
            Modular.to.navigate('/shop/menu');
            showSuccess('Pedido realizado com sucesso!');
            cartStore.cart.clear();
            break;
          case PaymentStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    addressEC.dispose();
    statusDisposer();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    final isWidthLess450 = screenWidth < 450;

    addressEC.text = (useMyAddress ?? false) ? user!.address : '';

    void onSaveOrder() {
      final isValid = formKey.currentState?.validate();
      switch (isValid) {
        case null || false:
          break;
        case true:
          controller.saveOrder(
            (
              userId: user!.id,
              orderItems: cartStore.cart,
              orderTotal: cartStore.getCartTotal,
              deliveryAddress: addressEC.text,
              paymentMethod: payment.name,
            ),
          );
          break;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const _TextLabel('Endereço '),
                    TextFormField(
                      controller: addressEC,
                      validator: Validatorless.required('Campo Obrigatório'),
                      readOnly: useMyAddress ?? false,
                      decoration: const InputDecoration(isDense: true),
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 15),
                        Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                            visualDensity: VisualDensity.compact,
                            value: useMyAddress,
                            onChanged: (value) {
                              setState(() {
                                useMyAddress = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Usar meu endereço',
                          style: FontsConstants.textLight.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const _TextLabel('Detalhes do Pedido'),
                    const SizedBox(height: 5),
                    const _TextLabel('Tempo Estimado: '),
                    const _TextValue('30 minutos'),
                    const SizedBox(height: 15),
                    const _TextLabel('Total do Pedido: '),
                    _TextValue(cartStore.getCartTotal.currencyPTBR),
                    const SizedBox(height: 15),
                    const _TextLabel('Forma de Pagamento:  '),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton<PaymentsEnum>(
                          value: payment,
                          onChanged: (method) {
                            setState(() {
                              payment = method!;
                            });
                          },
                          items: PaymentsEnum.values
                              .map(
                                (value) => DropdownMenuItem<PaymentsEnum>(
                                  value: value,
                                  enabled: value.enabled,
                                  child: _TextValue(value.method),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(isWidthLess450 ? 40 : 70),
                        textStyle: FontsConstants.textMedium.copyWith(
                          fontSize: isWidthLess450 ? 14 : 24,
                        ),
                      ),
                      onPressed: onSaveOrder,
                      child: const Text('Finalizar Pedido'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextLabel extends StatelessWidget {
  final String label;

  const _TextLabel(this.label);

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return Text(
      label,
      style: FontsConstants.textLight.copyWith(
        fontSize: screenWidth < 450 ? 14 : 24,
      ),
    );
  }
}

class _TextValue extends StatelessWidget {
  final String label;

  const _TextValue(this.label);

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return Text(
      label,
      style: FontsConstants.textRegular.copyWith(
        fontSize: screenWidth < 450 ? 14 : 24,
      ),
    );
  }
}
