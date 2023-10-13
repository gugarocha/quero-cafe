import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/widgets/base_header.dart';
import '../../core/ui/widgets/base_layout.dart';
import 'widgets/payment_form.dart';

enum PaymentsEnum {
  money('Dinheiro', true),
  pix('Pix (Indisponível)', false),
  creditCard('Cartão (Indisponível)', false);

  const PaymentsEnum(this.method, this.enabled);
  final String method;
  final bool enabled;
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      header: BaseHeader(
        pageName: 'Cardápio',
        pageIconData: Icons.coffee,
        onPagePressed: () {
          Modular.to.navigate('/menu');
        },
      ),
      body: Column(
        children: [
          const Text(
            'Pagamento',
            style: FontsConstants.textTitle,
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Modular.to.navigate('/order');
                    },
                    child: Text(
                      'Voltar para pedido',
                      style: FontsConstants.textRegular.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Expanded(child: PaymentForm()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
