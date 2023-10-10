import 'package:flutter/material.dart';

import '../constants.dart';
import '../helpers/size_extensions.dart';

class AuthFormContainer extends StatelessWidget {
  final Widget child;

  const AuthFormContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    final percentWidth = context.percentWidth;
    final percentHeight = context.percentHeight;

    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: percentWidth(screenWidth < 1024 ? 0.7 : 0.4),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Container(
                height: percentHeight(0.25),
                decoration: const BoxDecoration(
                  color: ColorsConstants.primary,
                  image: DecorationImage(
                    image: AssetImage(ImagesConstants.logo),
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
