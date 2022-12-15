import 'package:firebase_auth/firebase_auth.dart';

class AppController {
  User? _user;

  User? get user => _user;
  set user(User? newUser) => user = newUser;
}
