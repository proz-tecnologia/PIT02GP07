// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../core/theme/app_text_style.dart';

import '../../model/expenses_model.dart';
import '../../shared/widgets/value_widget.dart';
import '../home/components/creditcard_card.dart';


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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard(
              expenseInCreditCard: widget.expenseInCreditCard,
            ),
            const SizedBox(
              height: 12.0,
            ),
            ListView.builder(
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
                      widget.expenseInCreditCardList[index].name,
                      style: AppTextStyle.mediumWhite,
                    ),
                    subtitle: Text(
                      "${widget.expenseInCreditCardList[index].category} (${widget.expenseInCreditCardList[index].accountOrigin})",
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
      ),
    );
  }
}
