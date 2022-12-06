import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AcCount',
      theme: AppTheme.lightTheme,
      home: const HomePage(
        title: 'Carlos',
      ),
      //home: const HomePage(
        title: '',
      //),
    );
  }
}
