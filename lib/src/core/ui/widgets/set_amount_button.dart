import 'package:flutter/material.dart';

import '../constants.dart';

class SetAmountButton extends StatelessWidget {
  final int amount;
  final VoidCallback incrementButton;
  final VoidCallback decrementButton;
  final bool isCompact;

  const SetAmountButton({
    super.key,
    required this.amount,
    required this.incrementButton,
    required this.decrementButton,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: decrementButton,
          icon: const Icon(Icons.remove),
          iconSize: 24,
        ),
        Text(
          '$amount',
          style: FontsConstants.textSemiBold.copyWith(
            fontSize: isCompact ? 14 : 20,
          ),
        ),
        IconButton(
          onPressed: incrementButton,
          icon: const Icon(Icons.add),
          iconSize: 24,
        ),
      ],
    );
  }
}
