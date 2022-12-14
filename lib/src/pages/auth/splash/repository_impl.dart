import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pit02gp07/src/pages/auth/splash/repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    await _auth.createUserWithEmailAndPassword(email: email, password: password);

    await _auth.currentUser!.updateDisplayName(name);
    await _auth.currentUser!.sendEmailVerification();
  }

  @override
  User? getUser() => _auth.currentUser;

  @override
  //TODO - criar conta no firebase do App
  Future<FirebaseApp> init() async {
    return await Firebase.initializeApp(
      name: 'AcCount',
      options: const FirebaseOptions(
          apiKey: "AIzaSyAfsviH_zbQNiFdcUgrheye1hMfbW8TXL0",
          appId: '1:1041652698081:android:23e241cda257775da6a0a0',
          messagingSenderId:
              '1041652698081-b0ntmv4lanjcs8hddqpmrbi0v3guu4l8.apps.googleusercontent.com',
          projectId: 'account-cd7d3'),
    );
  }

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> recoveryPassword({required String user}) async {
    return await _auth.sendPasswordResetEmail(email: user);
  }
}
