import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/constants.dart';
import '../../../store/user/user_store.dart';
import '../user_page_base.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  final nameEC = TextEditingController();
  final addressEC = TextEditingController();
  final phoneEC = TextEditingController();

  final userStore = Modular.get<UserStore>();

  @override
  void initState() {
    super.initState();
    nameEC.text = userStore.user!.name;
    addressEC.text = userStore.user!.address;
    phoneEC.text = userStore.user!.phone;
  }

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    addressEC.dispose();
    phoneEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserPageBase(
      pageName: 'Meus Dados',
      onSavePress: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameEC,
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
            decoration: const InputDecoration(
              labelText: 'Telefone',
              suffixIcon: Icon(Icons.edit),
            ),
            keyboardType: TextInputType.phone,
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
    );
  }
}
