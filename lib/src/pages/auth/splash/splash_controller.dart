
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit02gp07/src/pages/auth/splash/repository.dart';
import 'package:pit02gp07/src/pages/auth/splash/splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  final AuthRepository repository;
  SplashBloc({required this.repository}) : super(SplashStateLoading());
  
  Future<void> setup() async {
    await initializeFirebase();
    hasUser();
  }

  Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp(
      name: 'AcCount',
      options: const FirebaseOptions(
        apiKey: "AIzaSyAfsviH_zbQNiFdcUgrheye1hMfbW8TXL0",
        appId: '1:1041652698081:android:23e241cda257775da6a0a0',
        messagingSenderId:
            '1041652698081-b0ntmv4lanjcs8hddqpmrbi0v3guu4l8.apps.googleusercontent.com',
        projectId: 'account-cd7d3',
      ),
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
