import 'package:flutter/material.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/helpers/size_extensions.dart';

class ListHeaderText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const ListHeaderText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return Text(
      text,
      textAlign: textAlign,
      style: FontsConstants.textLight.copyWith(
        fontSize: screenWidth < 400 ? 12 : 20,
      ),
    );
  }
}
