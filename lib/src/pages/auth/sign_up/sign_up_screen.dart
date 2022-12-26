import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/components/sign_up_button.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/controller/sign_up_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../components/password_validator.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final cubit = Modular.get<SignUpCubit>();
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
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
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {}),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageProfile(),
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
                          return 'Informe nome de usuário!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    //TODO: implementar junto à função 'recuperar senha'.
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
                        labelText: 'Confirmar Senha',
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
                  SignUpButton(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          // ignore: unnecessary_null_comparison
          backgroundImage: _imageFile == null
              ? null
              //AssetImage('assets/images/google.png')
              : FileImage(File(_imageFile!.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: AppColors.iceWhite,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Escolha uma foto de perfil',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: const Text('Câmera'),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text('Galeria'),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile! as PickedFile;
    });
  }
}
