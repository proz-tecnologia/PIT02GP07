import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/components/icon_button_return_widget.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/components/sign_up_button.dart';
import 'package:pit02gp07/src/pages/widgets/profile_picture.dart';

import '../../widgets/text_field_input_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkGray,
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
        leading: const IconButtonReturnWidget(),
        title: const Text('Registrar usuário.'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        ProfilePicture(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          textFieldInput(
                            label: 'Nome',
                          ),
                          textFieldInput(label: 'Email'),
                          textFieldInput(label: 'Senha', obsureText: true),
                          textFieldInput(
                              label: 'Confirmar Senha', obsureText: true)
                        ],
                      ),
                    ),
                    const SignUpButton(),
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
