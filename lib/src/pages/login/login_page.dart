import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/home/home_page.dart';
import 'package:pit02gp07/src/shared/constants/app_colors.dart';
import 'package:pit02gp07/src/shared/constants/password_validator.dart';

import 'package:pit02gp07/src/shared/widget/app_top_bar.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final RegExp nameRegExp = RegExp('[a-zA-Z]');

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = LoginController();
  final textController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const AppTopBar(title: 'AcCount'),
      body: SizedBox(
        height: height,
         child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Informe seu usuário.',
                    labelText: 'Usuário',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !nameRegExp.hasMatch(value)) {
                      return 'Informe um usuário válido!';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Senha',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, informe a senha!';
                    } else {
                      bool result = validatePassword(value);
                      if (result) {
                        return null;
                      } else {
                        return 'Senha incorreta!';
                      }
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _formKey.currentState?.validate() == true
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                        controller
                            .login(
                                name: textController.text,
                                password: passwordController.text)
                            .then((value) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const HomePage(title: 'AcCount'),
                              ));
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Logar'),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Cadastrar-se'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
