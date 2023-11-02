import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/widgets/password_form_field.dart';
import '../user_page_base.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final oldPasswordEC = TextEditingController();
  final newPasswordEC = TextEditingController();
  final confirmNewPasswordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    oldPasswordEC.dispose();
    newPasswordEC.dispose();
    confirmNewPasswordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserPageBase(
      pageName: 'Alterar Senha',
      onSavePress: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Modular.to.navigate('/user/edit');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          PasswordFormField(
            controller: oldPasswordEC,
            labelText: 'senha antiga',
          ),
          const SizedBox(
            height: 10,
          ),
          PasswordFormField(
            controller: newPasswordEC,
            labelText: 'nova senha',
          ),
          const SizedBox(
            height: 10,
          ),
          PasswordFormField(
            controller: confirmNewPasswordEC,
            labelText: 'confirmar nova senha',
          ),
        ],
      ),
    );
  }
}
