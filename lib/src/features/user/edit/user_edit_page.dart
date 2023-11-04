import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/constants.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../store/user/user_store.dart';
import '../user_page_base.dart';
import 'user_edit_controller.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> with Loader, Messages {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final addressEC = TextEditingController();
  final phoneEC = TextEditingController();

  final controller = Modular.get<UserEditController>();
  final userStore = Modular.get<UserStore>();

  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    nameEC.text = userStore.user!.name;
    addressEC.text = userStore.user!.address;
    phoneEC.text = userStore.user!.phone;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case UserEditStateStatus.initial:
            break;
          case UserEditStateStatus.loading:
            showLoader();
            break;
          case UserEditStateStatus.success:
            hideLoader();
            showSuccess('Alteração realizada com sucesso!');
            Modular.to.navigate('/shop/menu');
            break;
          case UserEditStateStatus.error:
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
    nameEC.dispose();
    addressEC.dispose();
    phoneEC.dispose();
    statusDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return UserPageBase(
      pageName: 'Meus Dados',
      onSavePress: () {
        final isValid = formKey.currentState?.validate();

        switch (isValid) {
          case null || false:
            break;
          case true:
            controller.editUser(
              (
                userId: userStore.user!.id,
                name: nameEC.text,
                address: addressEC.text,
                phone: phoneEC.text,
              ),
            );
            break;
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameEC,
              validator: Validatorless.required('Campo Obrigatório'),
              decoration: const InputDecoration(
                labelText: 'Nome',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addressEC,
              validator: Validatorless.required('Campo Obrigatório'),
              decoration: const InputDecoration(
                labelText: 'Endereço',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: phoneEC,
              keyboardType: TextInputType.phone,
              validator: Validatorless.multiple([
                Validatorless.required('Campo Obrigatório'),
                Validatorless.number(
                  'Digite um número de telefone válido',
                ),
                Validatorless.min(
                  9,
                  'Telefone deve conter 9 digitos',
                ),
                Validatorless.max(
                  9,
                  'Telefone deve conter 9 digitos',
                ),
              ]),
              decoration: const InputDecoration(
                labelText: 'Telefone',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Modular.to.navigate('/user/password');
              },
              child: Text(
                'Alterar Senha',
                style: FontsConstants.textRegular.copyWith(
                  color: ColorsConstants.primary,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
