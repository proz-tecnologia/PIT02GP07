import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/signup_error_card.dart';
import 'components/signup_success_card.dart';
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
  //late final String firstName;
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
          Navigator.of(context, rootNavigator: true).pop();
          showModalBottomSheet(
            context: context,
            builder: (context) => const ErrorCard(),
          );
        } else if (state is SignUpStateSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          showModalBottomSheet(
            context: context,
            builder: (context) => const SuccessCard(),
          );
        }
      },
      child: const SignUpScreen(),
    );
  }
}
