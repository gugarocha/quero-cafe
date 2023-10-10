import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/widgets/auth_form_container.dart';
import '../../core/ui/widgets/password_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
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
                        decoration: const InputDecoration(
                          labelText: 'e-mail',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PasswordFormField(controller: passwordEC),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
