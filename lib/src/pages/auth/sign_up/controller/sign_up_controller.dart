import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit02gp07/src/model/user_model.dart';
import 'package:pit02gp07/src/pages/auth/sign_up/state/sign_up_state.dart';
import '../../repository/repository.dart';

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

      await repository.createUserData(
        user: UserData(
          userName: name,
          userId: repository.getUser()!.uid),
      );

      emit(SignUpStateSuccess());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      emit(SignUpStateError());
    }
  }
}
