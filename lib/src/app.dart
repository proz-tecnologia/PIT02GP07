import 'package:flutter/material.dart';

import 'pages/homa.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

