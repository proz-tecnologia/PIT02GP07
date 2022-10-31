// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/home/page_view/home/cards/card_credit_card.dart';
import 'package:pit02gp07/src/pages/home/page_view/home/cards/expenses_card.dart';
import 'package:pit02gp07/src/pages/home/page_view/home/cards/wallet_card.dart';
import '../../../../model/model_home_screen_card.dart';

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
      padding: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
      ),
      children: const [
        ModelHomeScreenCard(
          title: 'Carteira',
          card: WalletCard(),
        ),
        ModelHomeScreenCard(
          title: 'Despesas por categoria',
          card: ExpensesCard(),
        ),
        ModelHomeScreenCard(
          title: 'Cartões cadastrados',
          card: CardCredit(),
        ),
      ],
    );
  }
}
