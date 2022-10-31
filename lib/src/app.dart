import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'shared/constants/app_theme.dart';

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
    );
  }
}
