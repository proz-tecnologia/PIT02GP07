// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/credit_card/add_new_card.dart';
import '../../core/theme/app_text_style.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({
    Key? key,
  }) : super(key: key);

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
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: AddNewCardScreen(),
        );
      },
    );
  }
}
