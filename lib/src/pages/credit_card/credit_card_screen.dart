// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                //temCount: widget.expenseInCreditCardListLength,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 8.0,
                    child: const ListTile(
                      title: Text(
                        'cartão 1',
                        style: AppTextStyle.mediumWhite,
                      ),
                      subtitle: Text(
                        'cartão1',
                        style: AppTextStyle.smallWhite,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
