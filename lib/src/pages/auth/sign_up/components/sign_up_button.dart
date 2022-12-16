import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';
import 'package:pit02gp07/src/pages/auth/login/login_page.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/controller/sign_up_controller.dart';


class SignUpButton extends StatelessWidget {
  final String name;
  final String mail;
  final String password;

  SignUpButton({
    super.key,
    required this.name,
    required this.mail,
    required this.password,
  });

  final cubit = Modular.get<SignUpCubit>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: ElevatedButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
          await cubit
              .signUp(
            name: name,
            email: mail,
            password: password,
          )
              .then(
            (value) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          );
        },
        child: const Text(
          'Confirmar',
          style: AppTextStyle.mediumWhiteBold,
        ),
      ),
    );
  }
}
