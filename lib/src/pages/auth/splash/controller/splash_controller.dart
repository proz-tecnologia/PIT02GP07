import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit02gp07/src/pages/auth/splash/state/splash_state.dart';
import '../../repository/repository.dart';

class SplashBloc extends Cubit<SplashState> {
  final AuthRepository repository;

  SplashBloc({
    required this.repository
    }) : super(SplashStateLoading());

  Future<void> setup() async {
    await repository.init();
    hasUser();
  }

  void hasUser() {
    final user = repository.getUser();

    if (user != null) {
      emit(SplashStateLogged(user: user));
    } else {
      emit(SplashStateNotLogged());
    }
  }
}
