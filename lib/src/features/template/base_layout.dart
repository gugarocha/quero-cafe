import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/size_extensions.dart';
import 'base_header.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;

  const BaseLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    return Scaffold(
      body: Column(
        children: [
          const BaseHeader(),
          Expanded(
            child: Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              color: ColorsConstants.background,
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
