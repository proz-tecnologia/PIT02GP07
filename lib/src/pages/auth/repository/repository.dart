import 'package:firebase_auth/firebase_auth.dart';
import '../../../model/user_model.dart';

abstract class AuthRepository {
  Future<void> init();

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<void> recoveryPassword({required String user});

  Future<void> createUserData({required UserData user});

  User? getUser();
}
