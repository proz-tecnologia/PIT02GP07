
import 'dart:developer';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../splash/repository/repository.dart';
import '../state/login_state.dart';

/* class LoginController {
  LoginState state = LoginStateEmpty();
  Future<LoginState> login({
    required String name,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    await prefs.setBool(SharedPreferencesKeys.hasUser, true);

    return LoginStateSuccess();
  }

  String userName(String name) {
    final firstName = name.split(' ').first;
    return firstName;
  }
}
 */

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit({required this.repository}) : super(LoginStateEmpty());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginStateLoading());
      final user = await repository.login(email: email, password: password);
      log(user.toString());
      emit(LoginStateSuccess());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      emit(LoginStateError());
    }
  }
}
