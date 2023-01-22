import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/auth/password_recovery/controller/recovery__password_cubit.dart';

import '../../../core/theme/app_colors.dart';

class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  State<RecoveryPasswordScreen> createState() => _RecoveryPasswordScreenState();
}

class _RecoveryPasswordScreenState extends State<RecoveryPasswordScreen> {
  final cubit = Modular.get<RecoveryPasswordCubit>();
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Informe o email.',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.iceWhite,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.recoveryPassword(
                  email: userController.text,
                );
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
    );
  }
}
