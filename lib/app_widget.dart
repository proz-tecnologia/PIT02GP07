import 'package:flutter/material.dart';
import 'src/pages/home/home_page.dart';
import 'src/core/theme/app_theme.dart';

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
