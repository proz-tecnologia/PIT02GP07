// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pit02gp07/src/app_widget.dart';
import 'package:pit02gp07/src/pages/credit_card/add_new_card.dart';

import '../home/state/home_state.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({
    Key? key,
    required this.state,
  }) : super(key: key);
  final HomeStateSuccess state;

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.credit_card_outlined),
    label: 'Cartão',
    tooltip: 'Ir para despesas no Cartão',
  );

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  //final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus cartões'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        child: ListView.builder(
          itemCount: widget.state.transactions.length,
          itemBuilder: (BuildContext context, int index) {
            return AddNewCardScreen();
          },
        ),
      ),
    );
  }
}
