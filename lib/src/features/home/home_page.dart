import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/size_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    final percentWidth = context.percentWidth;
    final percentHeight = context.percentHeight;

    final isWidthLess700 = screenWidth < 700;

    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            ImagesConstants.homeImage,
            width: isWidthLess700 ? screenWidth : percentWidth(0.45),
            height: screenHeight,
            color: isWidthLess700 ? Colors.black.withOpacity(0.6) : null,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
          ),
        ),
        Align(
          alignment: isWidthLess700 ? Alignment.center : Alignment.centerRight,
          child: Container(
            width: isWidthLess700 ? percentWidth(0.7) : percentWidth(0.55),
            height: isWidthLess700 ? percentHeight(0.8) : screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 52),
            decoration: BoxDecoration(
              color: ColorsConstants.primary,
              borderRadius: isWidthLess700 ? BorderRadius.circular(30) : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesConstants.logo,
                  width: percentWidth(0.25),
                  fit: BoxFit.cover,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const FittedBox(
                    child: Text(
                      'CARDÁPIO',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const FittedBox(
                    child: Text(
                      'Entrar/Cadastrar',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
