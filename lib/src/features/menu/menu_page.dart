import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'products_controller.dart';
import 'widgets/product_item.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with TickerProviderStateMixin, Loader, Messages {
  final controller = Modular.get<ProductsController>();

  late String selectedCategory;
  late final ReactionDisposer statusDisposer;
  late final TabController _tabController;

  final categories = [
    'Todos',
    'Cafés',
    'Chás',
    'Bebidas',
    'Café da Manhá',
    'Salgados',
    'Doces',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ProductsStateStatus.initial:
            break;
          case ProductsStateStatus.loading:
            showLoader();
            break;
          case ProductsStateStatus.loaded:
            hideLoader();
            break;
          case ProductsStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
        }
      });
      controller.getProducts(selectedCategory);
    });
    super.initState();
    selectedCategory = categories[0];
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    statusDisposer();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelStyle: FontsConstants.textRegular,
          labelColor: ColorsConstants.primary,
          onTap: (i) => setState(() {
            selectedCategory = categories[i];
            controller.getProducts(selectedCategory);
          }),
          tabs: categories.map((value) => Tab(text: value)).toList(),
        ),
        const Text(
          'Cardápio',
          style: FontsConstants.textTitle,
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: controller.products.length,
                itemBuilder: (context, index) =>
                    ProductItem(controller.products[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
