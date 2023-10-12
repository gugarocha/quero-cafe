import 'package:flutter/material.dart';

import '../constants.dart';
import '../helpers/size_extensions.dart';

class BaseHeader extends StatelessWidget {
  final String pageName;
  final IconData pageIconData;
  final VoidCallback onPagePressed;

  const BaseHeader({
    super.key,
    required this.pageName,
    required this.pageIconData,
    required this.onPagePressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final percentHeight = context.percentHeight;

    final isWidthLess420 = screenWidth < 420;

    return Container(
      width: screenWidth,
      height: percentHeight(0.15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: ColorsConstants.primary,
      child: Stack(
        children: [
          Image.asset(
            ImagesConstants.logo,
            height: percentHeight(isWidthLess420 ? 0.15 : 0.20),
            width: percentHeight(isWidthLess420 ? 0.15 : 0.20),
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onPagePressed,
                  icon: Icon(
                    pageIconData,
                    color: ColorsConstants.secondary,
                    size: isWidthLess420 ? 14 : null,
                  ),
                  label: Text(
                    pageName,
                    style: FontsConstants.textRegular.copyWith(
                      color: ColorsConstants.secondary,
                      fontSize: isWidthLess420 ? 14 : null,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.exit_to_app,
                    color: ColorsConstants.secondary,
                    size: isWidthLess420 ? 14 : null,
                  ),
                  label: Text(
                    'Sair',
                    style: FontsConstants.textRegular.copyWith(
                      color: ColorsConstants.secondary,
                      fontSize: isWidthLess420 ? 14 : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
