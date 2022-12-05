// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/cards/creditcard_card.dart';
import 'package:pit02gp07/src/pages/components/value_widget.dart';
import 'package:pit02gp07/src/pages/home/home_controller.dart';
import '../../core/theme/app_text_style.dart';
import '../../model/expenses_model.dart';

class CreditCardScreen extends StatefulWidget {
  final double expenseInCreditCard;
  final int expenseInCreditCardListLength;
  final List<ExpenseModel> expenseInCreditCardList;

  const CreditCardScreen({
    Key? key,
    required this.expenseInCreditCard,
    required this.expenseInCreditCardListLength,
    required this.expenseInCreditCardList,
  }) : super(key: key);

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.credit_card_outlined),
    label: 'Cartões',
    tooltip: 'Ir para Cartões',
  );

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: Column(
        children: [
          CreditCard(
            expenseInCreditCard: widget.expenseInCreditCard,
          ),
          const SizedBox(
            height: 12.0,
          ),
          ListView.builder(
            //todo: oveflow no botão quando o ListView fica maior que a area visível.
            shrinkWrap: true,
            itemCount: widget.expenseInCreditCardListLength,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 8.0,
                child: ListTile(
                  title: Text(
                    widget.expenseInCreditCardList[index].category,
                    style: AppTextStyle.mediumWhite,
                  ),
                  subtitle: const Text(
                    'Data',
                    style: AppTextStyle.smallWhite,
                  ),
                  trailing: ValueWidget(
                    value: widget.expenseInCreditCardList[index].value
                        .toStringAsFixed(2),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
