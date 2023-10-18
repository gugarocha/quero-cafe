import 'package:flutter/material.dart';

import '../constants.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 75,
                height: 75,
                child: CircularProgressIndicator(
                  color: ColorsConstants.secondary,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void hideLoader() {
    isOpen = false;
    Navigator.of(context, rootNavigator: true).pop();
  }
}
