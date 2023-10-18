import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/size_extensions.dart';
import 'widgets/list_header_text.dart';
import 'widgets/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    final isWidthLess400 = screenWidth < 400;
    final isWidthLess700 = screenWidth < 700;

    return Column(
      children: [
        const Text(
          'Meu Pedido',
          style: FontsConstants.textTitle,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 1100),
          padding: EdgeInsets.symmetric(
            horizontal: isWidthLess400 ? 8 : 20,
          ),
          child: Row(
            children: [
              SizedBox(
                width: isWidthLess400 ? 45 : 60,
                child: const ListHeaderText('Quant.'),
              ),
              SizedBox(width: isWidthLess400 ? 8 : 15),
              const Expanded(
                child: ListHeaderText(
                  'Produto',
                  textAlign: TextAlign.start,
                ),
              ),
              const ListHeaderText('Sub-total'),
            ],
          ),
        ),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            padding: EdgeInsets.fromLTRB(
              isWidthLess400 ? 8 : 20,
              isWidthLess400 ? 8 : 20,
              isWidthLess400 ? 8 : 20,
              20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: 8,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, __) => const OrderItem(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Total: ',
                            style: FontsConstants.textRegular.copyWith(
                              fontSize: isWidthLess400 ? 16 : 24,
                            ),
                          ),
                          Text(
                            'R\$ 60,00',
                            style: FontsConstants.textSemiBold.copyWith(
                              fontSize: isWidthLess400 ? 24 : 32,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  isWidthLess700 ? 10 : 20,
                                ),
                              ),
                              minimumSize:
                                  Size.fromHeight(isWidthLess700 ? 50 : 70),
                            ),
                            onPressed: () {
                              Modular.to.navigate('/shop/payment');
                            },
                            child: Text(
                              'Prosseguir para o pagamento',
                              textAlign: TextAlign.center,
                              style: FontsConstants.textMedium.copyWith(
                                fontSize: isWidthLess700 ? 18 : 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
