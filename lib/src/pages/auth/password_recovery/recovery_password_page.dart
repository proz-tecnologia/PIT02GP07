import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/pages/auth/login/components/login_error_card.dart';
import 'package:pit02gp07/src/pages/auth/login/components/login_success_card.dart';
import 'package:pit02gp07/src/pages/auth/password_recovery/controller/recovery__password_cubit.dart';
import 'package:pit02gp07/src/pages/auth/password_recovery/recovery_password_screen.dart';
import 'package:pit02gp07/src/pages/auth/password_recovery/state/recovery_password_state.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final userController = TextEditingController();
  final cubit = Modular.get<RecoveryPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar senha'),
      ),
      body: BlocListener<RecoveryPasswordCubit, RecoveryPasswordState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is RecoveryPasswordStateLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is RecoveryPasswordStateSuccess) {
            Modular.to.pop();
            showModalBottomSheet(
              context: context,
              builder: (context) => CustomSuccessCard(
                  successMessage:
                      'Você receberá um email para alteração de senha no email cadastrado.',
                  onButtonPressed: () {
                    Modular.to.popUntil(
                      ModalRoute.withName(
                        '/login',
                      ),
                    );
                  }),
            );
          } else if (state is RecoveryPasswordStateError) {
            Modular.to.pop();
            showModalBottomSheet(
              context: context,
              builder: (context) => const CustomErrorCard(
                errorMessage: 'Email inválido!',
              ),
            );
          }
        },
        child: const RecoveryPasswordScreen(),
      ),
    );
  }
}
