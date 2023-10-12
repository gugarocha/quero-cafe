import 'package:flutter/material.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/widgets/set_amount_button.dart';
import '../../../models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel(:name, :description, :price, :imageUrl) = ProductModel(
      name: 'Xicara de Café',
      description:
          'DescriçãoDescriçãoDescriçãoDescrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição Descrição',
      price: 10,
      imageUrl:
          'https://media.istockphoto.com/id/1358132613/pt/foto/refreshing-hot-cup-of-coffee-at-a-cafe.jpg?s=1024x1024&w=is&k=20&c=Hq5sGjDK30Q1WwFYuM5S-nV5vlGDGMNmACvqsmqGzBE=',
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidthLess310 = constraints.maxWidth < 310;

        return Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                width: 420,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: maxWidthLess310 ? 5 : 15,
                  horizontal: maxWidthLess310 ? 10 : 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        name,
                        style: FontsConstants.textSemiBold.copyWith(
                          fontSize: maxWidthLess310 ? 20 : 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: maxWidthLess310 ? 2 : 5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          description,
                          style:
                              FontsConstants.textLight.copyWith(fontSize: 16),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: maxWidthLess310 ? 2 : 5,
                      ),
                      child: Text(
                        'R\$ ${price.toStringAsFixed(2)}',
                        style: FontsConstants.textSemiBold.copyWith(
                          fontSize: maxWidthLess310 ? 26 : 32,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          child: SetAmountButton(),
                        ),
                        Flexible(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: Size(
                                120,
                                maxWidthLess310 ? 40 : 50,
                              ),
                              textStyle: FontsConstants.textRegular.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_shopping_cart_sharp,
                              size: 20,
                            ),
                            label: const FittedBox(
                              child: Text('Adicionar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
