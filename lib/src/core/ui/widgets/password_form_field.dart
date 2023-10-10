import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const PasswordFormField({
    super.key,
    this.labelText = 'senha',
    required this.controller,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: hidePassword,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: FaIcon(
            hidePassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
          ),
        ),
      ),
    );
  }
}
