// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/auth/login/components/widgets/password_form_field_widget.dart';
import 'package:pit02gp07/src/pages/auth/login/components/widgets/user_form_field_widget.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

import 'controller/login_controller.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final cubit = Modular.get<LoginCubit>();

  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Image.asset(
                        'assets/images/bank.png',
                        color: AppColors.iceWhite,
                      ),
                    ),
                    const Text(
                      'AcCount',
                      style: AppTextStyle.logoBold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const UserFormField(),
                const PasswordFormField(),
                Container(
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
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Recuperar a senha.',
                    style: AppTextStyle.smallWhite,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Modular.to.pushReplacementNamed('/signUp');
                  },
                  child: const Text(
                    'Cadastrar-se',
                    style: AppTextStyle.smallWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
