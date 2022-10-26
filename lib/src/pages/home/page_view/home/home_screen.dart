// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Inicial',
    tooltip: 'Ir para tela principal',
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        //TODO: como adicionar cards na HomeScreen
        //
        // ModelHomeScreenCard(
        //   title: 'titulo do card',
        //   card: 'adicionar a classe onde está o card',
        // ),
        //
      ],
    );
  }
}
