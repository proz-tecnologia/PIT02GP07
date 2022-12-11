import 'package:shared_preferences/shared_preferences.dart';
import '../../components/shared_preferences_keys.dart';
import '../state/login_state.dart';

class LoginController {
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
}