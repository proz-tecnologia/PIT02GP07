import 'package:firebase_core/firebase_core.dart';

class SplashController {
  Future<void> setup() async {
   await  initializedFirebase();
  }

  Future<FirebaseApp> initializedFirebase() async {
    return await Firebase.initializeApp();
  }
}
