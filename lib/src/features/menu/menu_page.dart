import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import 'widgets/product_item.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
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
          tabs: const [
            Tab(text: 'Todos'),
            Tab(text: 'Bebidas Quente'),
            Tab(text: 'Bebidas Fria'),
            Tab(text: 'Café da Manhã'),
            Tab(text: 'Salgados'),
            Tab(text: 'Sobremesas'),
          ],
        ),
        const Text(
          'Cardápio',
          style: FontsConstants.textTitle,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 4,
            ),
            itemCount: 5,
            itemBuilder: (context, index) => const ProductItem(),
          ),
        ),
      ],
    );
  }
}
