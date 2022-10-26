import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'shared/constants/custon_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AcCount',
      theme: CustomTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
