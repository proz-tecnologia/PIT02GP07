import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/sign_up_page.dart';
import 'package:pit02gp07/src/pages/home/home_page.dart';
import '../../../core/theme/app_colors.dart';
import '../components/password_validator.dart';
import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final String firstName;
  final _formKey = GlobalKey<FormState>();
  final controller = LoginController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  late final PageController pageController;
  final RegExp nameRegExp = RegExp('[a-zA-Z]');
  bool invisible = true;

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
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 32,
                  ),
                  child: TextFormField(
                    controller: nameController,
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
                            showDialog(
                              context: context,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            firstName =
                                controller.userName(nameController.text);
                            controller
                                .login(
                                    name: nameController.text,
                                    password: passwordController.text)
                                .then(
                              (value) {
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(
                                      title: firstName,
                                    ),
                                  ),
                                );
                              },
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
