// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'sign_up_controller.dart';

abstract class SignUpState {}

class SignUpStateEmpty extends SignUpState {}

class SignUpStateLoading extends SignUpState {}

class SignUpStateSuccess extends SignUpState {}

class SignUpStateError extends SignUpState {
  final Exception exception;
  final String message;

  SignUpStateError({
    required this.exception,
    required this.message,
  });


}

class SignUpErrorBody extends StatelessWidget {
  const SignUpErrorBody({
    Key? key,
    required SignUpStateError state,
    required this.controller,
  })  : _state = state,
        super(key: key);

  final SignUpStateError _state;
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ops! Algo deu errado.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(_state.message),
          Text(
            'Tente novamente em instantes!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            onPressed: () => controller.setEmpty(),
            child: const Text('Checar meus dados'),
          ),
        ],
      ),
    );
  }
}
