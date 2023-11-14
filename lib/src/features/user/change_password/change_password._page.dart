import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/password_form_field.dart';
import '../user_page_base.dart';
import 'change_password_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>
    with Loader, Messages {
  final formKey = GlobalKey<FormState>();
  final oldPasswordEC = TextEditingController();
  final newPasswordEC = TextEditingController();
  final confirmNewPasswordEC = TextEditingController();

  final controller = Modular.get<ChangePasswordController>();

  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ChangePasswordStateStatus.initial:
            break;
          case ChangePasswordStateStatus.loading:
            showLoader();
            break;
          case ChangePasswordStateStatus.success:
            hideLoader();
            showSuccess('Senha alterada com sucesso');
            Modular.to.navigate('/shop/menu');
            break;
          case ChangePasswordStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordEC.dispose();
    newPasswordEC.dispose();
    confirmNewPasswordEC.dispose();
    statusDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return UserPageBase(
      pageName: 'Alterar Senha',
      onSavePress: () {
        final isValid = formKey.currentState?.validate();

        switch (isValid) {
          case null || false:
            break;
          case true:
            controller.changePassword(oldPasswordEC.text, newPasswordEC.text);
            break;
        }
      },
      child: Form(
        key: formKey,
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
              validator: Validatorless.required('Campo Obrigatório'),
            ),
            const SizedBox(
              height: 10,
            ),
            PasswordFormField(
              controller: newPasswordEC,
              labelText: 'nova senha',
              validator: Validatorless.multiple([
                Validatorless.required('Campo Obrigatório'),
                Validatorless.min(
                  6,
                  'Senha deve conter no mínimo 6 caracteres',
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            PasswordFormField.confirm(
              controller: confirmNewPasswordEC,
              labelText: 'confirmar nova senha',
              validator: Validatorless.multiple([
                Validatorless.required('Campo Obrigatório'),
                Validatorless.compare(
                  newPasswordEC,
                  'Senhas não conferem',
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
