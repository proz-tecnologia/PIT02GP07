
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/state/sign_up_state.dart';
import '../../splash/repository/repository.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository repository;

  SignUpCubit({
    required this.repository,
  }) : super(SignUpStateEmpty());

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      emit(SignUpStateLoading());

      await repository.signUp(
        name: name,
        email: email,
        password: password,
      );

      emit(SignUpStateSuccess());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      emit(SignUpStateError());
    }
  }
}



// class SignUpController {
//   // SignUpController({
//   //   required this.onUpdate,
//   // });

//   // final VoidCallback onUpdate;

//   SignUpState state = SignUpStateEmpty();

//   // ignore: no_leading_underscores_for_local_identifiers
//   void updateState(SignUpState _state) {
//     state = _state;
//     //onUpdate();
//   }

//   void setEmpty() => updateState(SignUpStateEmpty());

//   Future<void> signUp({
//     required String name,
//     required String mail,
//     required String password,
//   }) async {
//     try {
//       updateState(
//         SignUpStateLoading(),
//       );
//       //TODO: salvar dados de cadastro em armazenamento.
//       log(
//         'salvando dados de cadastro',
//       );
//       await Future.delayed(
//         const Duration(
//           seconds: 3,
//         ),
//       );
//       updateState(
//         SignUpStateSuccess(),
//       );
//     } catch (e) {
//       updateState(
//         SignUpStateError(),
//       );
//     }
//   }
// }
