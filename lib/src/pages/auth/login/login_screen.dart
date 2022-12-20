// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../components/password_validator.dart';
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
  final RegExp nameRegExp = RegExp('[a-zA-Z]');
  final textFieldFocusNode = FocusNode();

  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 32,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Informe nome de usuário.',
                      labelText: 'Usuário',
                      labelStyle: TextStyle(
                        color: AppColors.iceWhite,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.iceWhite,
                        ),
                      ),
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 32,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscured,
                    focusNode: textFieldFocusNode,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Informe senha de usuário.',
                      labelText: 'Senha',
                      labelStyle: const TextStyle(
                        color: AppColors.iceWhite,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.iceWhite,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleObscured,
                          child: Icon(
                            _obscured
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe uma senha válida!';
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
                Container(
                  padding: const EdgeInsets.all(32.0),
                  child: ElevatedButton(
                    onPressed: _formKey.currentState?.validate() == true
                        ? () {
                            // firstName =
                            //     cubit.userName(emailController.text);
                            cubit.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
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
                    Modular.to.pushNamed('/signUp');
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
