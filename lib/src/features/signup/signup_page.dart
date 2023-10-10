import 'package:flutter/material.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/widgets/auth_form_container.dart';
import '../../core/ui/widgets/password_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final addressEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    phoneEC.dispose();
    addressEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    final percentWidth = context.percentWidth;
    final percentHeight = context.percentHeight;

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
                    decoration: const InputDecoration(
                      labelText: 'telefone',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addressEC,
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
                    decoration: const InputDecoration(
                      labelText: 'e-mail',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordFormField(
                    controller: passwordEC,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordFormField(
                    labelText: 'confirmar senha',
                    controller: confirmPasswordEC,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
