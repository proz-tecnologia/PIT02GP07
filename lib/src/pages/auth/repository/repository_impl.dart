import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../model/user_model.dart';
import 'repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _auth.currentUser!.updateDisplayName(name);
    await _auth.currentUser!.sendEmailVerification();
  }

  @override
  User? getUser() => _auth.currentUser;

  @override
  Future<FirebaseApp> init() async {
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

  @override
  Future<void> createUserData({required UserData user}) async {
    await FirebaseFirestore.instance.collection('users').add(
          user.toMap(),
        );
  }
}
