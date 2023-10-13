import 'package:flutter/material.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../payment_page.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  bool? useMyAddress = true;
  PaymentsEnum payment = PaymentsEnum.money;

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    final isWidthLess450 = screenWidth < 450;

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
              child: Column(
                children: [
                  const _TextLabel('Endereço '),
                  TextFormField(
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
                  const _TextValue('50 minutos'),
                  const SizedBox(height: 15),
                  const _TextLabel('Total do Pedido: '),
                  const _TextValue('R\$ 60,00'),
                  const SizedBox(height: 15),
                  const _TextLabel('Forma de Pagamento:  '),
                  DropdownButton<PaymentsEnum>(
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
                  ),
                ],
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
                      onPressed: () {},
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
