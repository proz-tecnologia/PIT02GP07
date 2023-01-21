// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/sign_up_feedback.dart';
import 'controller/sign_up_controller.dart';
import 'sign_up_screen.dart';
import 'state/sign_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final cubit = Modular.get<SignUpCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is SignUpStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SignUpStateError) {
          Modular.to.pop();
          showDialog(
            context: context,
            builder: (context) {
              return SignUpFeedBack(
                message: 'Erro ao criar sua conta!',
                textButton: 'Tentar novamente',
                onPressed: () {
                  Modular.to.pop();
                },
              );
            },
          );
        } else if (state is SignUpStateSuccess) {
          Modular.to.pop();
          showDialog(
            context: context,
            builder: (context) {
              return SignUpFeedBack(
                message: 'Conta criada com sucesso!',
                textButton: 'Ir para login',
                onPressed: () {
                  Modular.to.pushNamed(
                    '/login',
                  );
                },
              );
            },
          );
        }
      },
      child: const SignUpScreen(),
    );
  }
}
