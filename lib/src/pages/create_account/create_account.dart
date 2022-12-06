import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

final RegExp nameRegExp = RegExp('[a-zA-Z]');
bool invisible = true;

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  final _passwordConfirmationFocusNode = FocusNode();

  late final CreateAccountControler controller;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Cadastro de usuário:'),
      ),
      body: Builder(builder: (context) {
        if (state == CreateAccountStateError) {
          final _state = controller.state as CreateAccountStateError;
          return CreateAccountErrorBody(
            state: _state,
            controller: controller,
          );
        } else if (state == CreateAccountStateLoading) {
          return const CustomLoading();
        }

        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  onChanged: () {
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.iceWhite
                              ),
                            ),
                            hintText: 'Informe seu nome completo.',
                            labelText: 'Nome:',
                            labelStyle: TextStyle(color: AppColors.iceWhite)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],

            ),

        ))
      }),
    );
  }
}
