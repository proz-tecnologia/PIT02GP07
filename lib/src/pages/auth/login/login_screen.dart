// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/auth/login/components/widgets/login_button_widget.dart';
import 'package:pit02gp07/src/pages/auth/login/components/widgets/password_form_field_widget.dart';
import 'package:pit02gp07/src/pages/auth/login/components/widgets/user_form_field_widget.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

import 'controller/login_controller.dart';
import '../sign_up/sign_up_page.dart';

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
                const LoginButton(),
                
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Recuperar a senha.',
                    style: AppTextStyle.smallWhite,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
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
