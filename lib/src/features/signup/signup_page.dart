import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/widgets/auth_form_container.dart';
import '../../core/ui/widgets/password_form_field.dart';
import '../../store/user/user_store.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with Messages, Loader {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final addressEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  final controller = Modular.get<UserStore>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => controller.status,
      (status) {
        switch (status) {
          case AuthStateStatus.initial:
            break;
          case AuthStateStatus.loading:
            showLoader();
            break;
          case AuthStateStatus.success:
            showSuccess('Cadastro realizado com sucesso');
            hideLoader();
            Modular.to.navigate('/shop/menu');
            break;
          case AuthStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    phoneEC.dispose();
    addressEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    statusReactionDisposer();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    Future<void> submit() async {
      final isValid = formKey.currentState?.validate();

      switch (isValid) {
        case false || null:
          break;
        case true:
          controller.signup(
            address: addressEC.text,
            name: nameEC.text,
            phone: phoneEC.text,
            email: emailEC.text,
            password: passwordEC.text,
          );
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImagesConstants.backgroundImage,
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.8),
            colorBlendMode: BlendMode.darken,
          ),
          Form(
            key: formKey,
            child: AuthFormContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      'Cadastrar',
                      style: FontsConstants.textRegular.copyWith(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameEC,
                    validator: Validatorless.required('Campo Obrigatório'),
                    decoration: const InputDecoration(
                      labelText: 'nome',
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
                      labelText: 'telefone',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addressEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'endereço',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailEC,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                      Validatorless.email('Digite um e-mail válido'),
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'e-mail',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordFormField(
                    controller: passwordEC,
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
                  PasswordFormField(
                    controller: confirmPasswordEC,
                    labelText: 'confirmar senha',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                      Validatorless.compare(
                        passwordEC,
                        'Senhas não conferem',
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: submit,
                    child: const FittedBox(
                      child: Text('Cadastrar-se'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
