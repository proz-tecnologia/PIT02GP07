import 'dart:ui';

import 'sign_up_state.dart';

class SignUpController {
  SignUpController({
    required this.onUpdate,
  });

  final VoidCallback onUpdate;

  SignUpState state = SignUpStateEmpty();

  // ignore: no_leading_underscores_for_local_identifiers
  void updateState(SignUpState _state) {
    state = _state;
    onUpdate();
  }

  void setEmpty() => updateState(SignUpStateEmpty());

  Future<void> signUp({
    required String name,
    required String mail,
    required String password,
  }) async {
    try {
      updateState(SignUpStateLoading());

      await Future.delayed(const Duration(seconds: 3));

      updateState(SignUpStateSuccess());
    } catch (e) {
      updateState(
        SignUpStateError(
          exception: Exception(''),
          message: '',
        ),
      );
    }
  }

}