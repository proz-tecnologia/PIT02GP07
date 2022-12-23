import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit02gp07/src/pages/auth/password_recovery/state/recovery_password_state.dart';
import 'package:pit02gp07/src/pages/auth/splash/repository/repository.dart';

class RecoveryPasswordCubit extends Cubit<RecoveryPasswordState> {
  final AuthRepository repository;
  RecoveryPasswordCubit({required this.repository})
      : super(RecoveryPasswordStateEmpty());

  Future<void> recoveryPassword({required String email}) async {
    try {
      emit(RecoveryPasswordStateLoading());
      await repository.recoveryPassword(user: email);
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      emit(RecoveryPasswordStateError());
    }
  }
}
