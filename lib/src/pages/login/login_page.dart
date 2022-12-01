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
bool invisible = true;

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = LoginController();
  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscured,
                    focusNode: textFieldFocusNode,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Senha',
                      isDense: true,
                      border: const UnderlineInputBorder(),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleObscured,
                          child: Icon(
                            _obscured
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            size: 24,
                          ),
                        ),
                      ),
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
                              .then(
                            (value) {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const HomePage(title: 'AcCount'),
                                  ));
                            },
                          );
                        }
                      : null,
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.darkGray),
                      foregroundColor:
                          MaterialStateProperty.all(AppColors.iceWhite),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Logar'),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.iceWhite,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Cadastre-se',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 3.0,
                        width: 145.0,
                        color: AppColors.lightGreen,
                      ),
                    ),
                    const Text(
                      'ou',
                      style: TextStyle(fontSize: 25.0, color: AppColors.iceWhite),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 3.0,
                        width: 145.0,
                        color: AppColors.lightGreen,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.iceWhite),
                        shape: MaterialStateProperty.all(
                          const ContinuousRectangleBorder(
                            side:
                                BorderSide(width: 0.5, color: AppColors.darkGray),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.iceWhite),
                          shape: MaterialStateProperty.all(
                            const ContinuousRectangleBorder(
                              side: BorderSide(
                                  width: 0.5, color: AppColors.darkGray),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              fit: BoxFit.contain,
                              width: 40.0,
                              height: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
