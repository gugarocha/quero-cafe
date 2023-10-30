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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  bool hidePassword = true;

  final controller = Modular.get<UserStore>();
  late final ReactionDisposer reactionStatusDisposer;

  @override
  void initState() {
    reactionStatusDisposer = reaction((_) => controller.status, (status) {
      switch (status) {
        case AuthStateStatus.initial:
          break;
        case AuthStateStatus.loading:
          showLoader();
          break;
        case AuthStateStatus.success:
          hideLoader();
          Modular.to.navigate('/shop/menu');
          break;
        case AuthStateStatus.error:
          hideLoader();
          showError(controller.errorMessage!);
          break;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    reactionStatusDisposer();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

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
              onBackButtonPressed: () => Modular.to.navigate('/'),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login',
                        style: FontsConstants.textRegular.copyWith(
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                        validator: Validatorless.required('Campo Obrigatório'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final isValid = formKey.currentState?.validate();

                          switch (isValid) {
                            case false || null:
                              break;
                            case true:
                              controller.login(emailEC.text, passwordEC.text);
                          }
                        },
                        child: const Text('Entrar'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: FittedBox(
                          child: TextButton(
                            onPressed: () {
                              Modular.to.navigate('/signup');
                            },
                            child: const Text('Não possui cadastro?'),
                          ),
                        ),
                      ),
                    ],
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
