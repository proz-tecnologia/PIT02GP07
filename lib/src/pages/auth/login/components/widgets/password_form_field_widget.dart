// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../components/password_validator.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final textFieldFocusNode = FocusNode();

    bool _obscured = true;

    void _toggleObscured() {
      setState(() {
        _obscured = !_obscured;
        if (textFieldFocusNode.hasPrimaryFocus) return;
        textFieldFocusNode.canRequestFocus = true;
      });
    }

    return Container(
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
    );
  }
}
