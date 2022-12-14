import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class UserFormField extends StatelessWidget {
  const UserFormField({super.key});


  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final RegExp nameRegExp = RegExp('[a-zA-Z]');

    return Container(
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
    );
  }
}