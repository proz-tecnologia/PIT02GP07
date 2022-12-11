import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/controller/sign_up_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../components/password_validator.dart';
import '../login/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = SignUpController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
  bool _obscuredPassword = true;
  bool _obscuredConfirm = true;
  late final PageController pageController;
  final RegExp nameRegExp = RegExp('[a-zA-Z]');
  bool invisible = true;

  void _toggleObscuredPassword() {
    setState(() {
      _obscuredPassword = !_obscuredPassword;
      if (passwordFocusNode.hasPrimaryFocus) return;
      passwordFocusNode.canRequestFocus = true;
    });
  }

  void _toggleObscuredConfirm() {
    setState(() {
      _obscuredConfirm = !_obscuredConfirm;
      if (confirmFocusNode.hasPrimaryFocus) return;
      confirmFocusNode.canRequestFocus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Registrar usuário.'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {}),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          color: AppColors.lightGreen,
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
                          return 'Informe nome de usuário!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    //TODO: implementar junto à função "recuperar senha".
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 32,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'Informe um e-mail.',
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                          color: AppColors.lightGreen,
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
                          return 'Informe um e-mail válido!';
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
                      obscureText: _obscuredPassword,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'Digite uma senha.',
                        labelText: 'Senha',
                        labelStyle: const TextStyle(
                          color: AppColors.lightGreen,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.iceWhite,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                            onTap: _toggleObscuredPassword,
                            child: Icon(
                              _obscuredPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite uma senha!';
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 32,
                    ),
                    child: TextFormField(
                      controller: confirmController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscuredConfirm,
                      focusNode: confirmFocusNode,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'Digite a senha novamente.',
                        labelText: 'Senha',
                        labelStyle: const TextStyle(
                          color: AppColors.lightGreen,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.iceWhite,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                            onTap: _toggleObscuredConfirm,
                            child: Icon(
                              _obscuredConfirm
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite a senha novamente!';
                        } else if (value == passwordController.text) {
                          return null;
                        } else {
                          return 'Senha não confere, digite novamente!';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(32.0),
                    child: ElevatedButton(
                      onPressed: _formKey.currentState?.validate() == true
                          ? () async {
                              showDialog(
                                context: context,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                              await controller
                                  .signUp(
                                name: nameController.text,
                                mail: emailController.text,
                                password: passwordController.text,
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
                            }
                          : null,
                      child: const Text(
                        'Confirmar',
                        style: AppTextStyle.mediumWhiteBold,
                      ),
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
