import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/home/home_page.dart';
import 'package:pit02gp07/src/shared/constants/app_colors.dart';
import 'package:pit02gp07/src/shared/constants/password_validator.dart';

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
  late final PageController pageController;

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
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
        leading: SizedBox(
          width: 50,
          child: Image.asset('assets/images/bank.png'),
        ),
        leadingWidth: 200,
        title: const Text('AcCount',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          height: height,
          width: double.infinity,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {}),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.lightGreen)),
                        hintText: 'Informe seu usuário.',
                        labelText: 'Usuário',
                        labelStyle: TextStyle(color: AppColors.lightGreen),
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
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscured,
                      focusNode: textFieldFocusNode,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Senha',
                        labelStyle:
                            const TextStyle(color: AppColors.lightGreen),
                        isDense: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightGreen),
                        ),
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
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
                                            const HomePage(title: 'Carlos'),
                                      ));
                                },
                              );
                            }
                          : null,
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(400, 40)),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.darkGray),
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.iceWhite),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
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
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.iceWhite),
                    onPressed: () {},
                    child: const Text('Recuperar a senha.'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.iceWhite,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Cadastrar-se',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.0,
                          width: 145.0,
                          color: AppColors.lightGreen,
                        ),
                        const Text(
                          'ou',
                          style: TextStyle(
                              fontSize: 25.0, color: AppColors.iceWhite),
                        ),
                        Container(
                          height: 3.0,
                          width: 145.0,
                          color: AppColors.lightGreen,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: AppColors.darkGray),
                          ),
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
                            child: Image.asset(
                              'assets/images/facebook.png',
                              fit: BoxFit.contain,
                              width: 40.0,
                              height: 50.0,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: AppColors.darkGray),
                          ),
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
                            child: Image.asset(
                              'assets/images/google.png',
                              fit: BoxFit.contain,
                              width: 40.0,
                              height: 50.0,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 3, color: AppColors.darkGray),
                          ),
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
                            child: Image.asset(
                              'assets/images/twitter.png',
                              fit: BoxFit.contain,
                              width: 40.0,
                              height: 50.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
