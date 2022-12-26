// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../core/theme/app_text_style.dart';

import '../../controller/login_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final cubit = Modular.get<LoginCubit>();

    final passwordController = TextEditingController();
    final emailController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
        onPressed: _formKey.currentState?.validate() == true
            ? () {
                // firstName =
                //     cubit.userName(emailController.text);
                cubit
                    .login(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((value) {
                  Navigator.pop(context);
                  Modular.to.pushReplacementNamed('/home');
                });
              }
            : null,
        child: const Text(
          'Logar',
          style: AppTextStyle.mediumWhiteBold,
        ),
      ),
    );
  }
}
