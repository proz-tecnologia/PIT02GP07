import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/app_controller.dart';
import 'package:pit02gp07/src/pages/auth/login/login_screen.dart';
import 'components/login_error_card.dart';
import 'controller/login_controller.dart';
import 'state/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cubit = Modular.get<LoginCubit>();

  late final String firstName;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginStateError) {
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            builder: (context) => const CustomErrorCard(
                errorMessage: 'Erro ao logar, tente novamente!,'),
          );
        } else if (state is LoginStateSuccess) {
          Modular.get<AppController>().user = state.user;

          Navigator.pop(context);
          Modular.to.pushReplacementNamed('/home/');
        }
      },
      child: const LoginScreen(),
    );
  }
}
