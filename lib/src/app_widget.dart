import 'package:flutter/material.dart';
//import 'package:pit02gp07/src/pages/auth/login/login_page.dart';
import 'core/theme/app_theme.dart';
import 'pages/auth/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AcCount',
      theme: AppTheme.theme,
      home: const SplashPage(),
    );
  }
}
