import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef Validator = String? Function(String?)?;

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Validator? validator;

  const PasswordFormField({
    super.key,
    required this.controller,
    this.labelText = 'senha',
    this.validator,
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
      validator: widget.validator,
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
