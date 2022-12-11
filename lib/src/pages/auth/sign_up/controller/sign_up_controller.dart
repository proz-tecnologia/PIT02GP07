import 'dart:developer';
import 'dart:ui';
import '../state/sign_up_state.dart';

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

      //TODO: salvar dados de cadastro em armazenamento.
      log('salvando dados de cadastro');
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
