import 'package:flutter/material.dart';

import '../constants.dart';

class SetAmountButton extends StatelessWidget {
  const SetAmountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove),
          iconSize: 24,
        ),
        Text(
          '1',
          style: FontsConstants.textSemiBold.copyWith(
            fontSize: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
          iconSize: 24,
        ),
      ],
    );
  }
}
