
RegExp passwordValidation = RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)');

bool validatePassword(String password) {
  // ignore: no_leading_underscores_for_local_identifiers
  String _password = password.trim();

  if (passwordValidation.hasMatch(_password)) {
    return true;
  } else {
    return false;
  }
}