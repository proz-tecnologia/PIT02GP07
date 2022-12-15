import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/app_controller.dart';
import 'package:pit02gp07/src/pages/auth/splash/state/splash_state.dart';

import '../../repository/repository.dart';

class SplashBloc extends Cubit<SplashState> {
  final AuthRepository repository;
  SplashBloc({required this.repository}) : super(SplashStateLoading());

  Future<void> setup() async {
    await initializeFirebase();
    hasUser();
  }

  Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp(
      name: 'AcCount Finance App',
      options: const FirebaseOptions(
          apiKey: "AIzaSyA65apA03G1yrnZT1HjJmtGSdSz2Se8yDw",
          appId: '1:494955119206:android:f8ed79a4fbd0b6c37563a7',
          messagingSenderId:
              '494955119206-ooais6ks5or3utqhj889s4h8sh689kbs.apps.googleusercontent.com',
          projectId: 'account-finance-app'),
    );
  }

  void hasUser() {
    final user = repository.getUser();

    if (user != null) {
      
      emit(SplashStateLogged());
    } else {
      emit(SplashStateNotLogged());
    }
  }
}
