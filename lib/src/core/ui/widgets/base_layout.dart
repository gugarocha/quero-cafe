import 'package:flutter/material.dart';

import '../constants.dart';
import '../helpers/size_extensions.dart';

class BaseLayout extends StatelessWidget {
  final Widget? header;
  final Widget body;

  const BaseLayout({
    super.key,
    this.header,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    return Scaffold(
      body: Column(
        children: [
          header ?? const SizedBox.shrink(),
          Expanded(
            child: Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              color: ColorsConstants.background,
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
