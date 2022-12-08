import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/components/value_widget.dart';
import 'package:pit02gp07/src/pages/transactions/current_transactions/controller/transaction_controller.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../model/expenses_model.dart';
import 'components/transaction_resume_card.dart';

class TransactionsScreen extends StatefulWidget {
  final double revenueValue;
  final double expenseValue;

  final int entryListLength;
  final List<ExpenseModel> entrylist;

  const TransactionsScreen({
    Key? key,
    required this.revenueValue,
    required this.expenseValue,
    required this.entryListLength,
    required this.entrylist,
  }) : super(key: key);

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.compare_arrows_outlined),
    label: 'Transações',
    tooltip: 'Ir para Transações',
  );

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final controller = TransactionsController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: TransactionResumeCard(
                revenueValue: widget.revenueValue,
                expenseValue: widget.expenseValue,
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ListView.builder(
            //todo oveflow no botão quando o ListView fica maior que a area visível.
            shrinkWrap: true,
            itemCount: widget.entryListLength,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 8.0,
                child: ListTile(
                  title: Text(
                    widget.entrylist[index].name,
                    style: AppTextStyle.largeWhite,
                  ),
                  subtitle: Text(
                    widget.entrylist[index].category,
                    style: AppTextStyle.smallWhite,
                  ),
                  trailing: ValueWidget(
                    value: widget.entrylist[index].value.toStringAsFixed(2),
                    style: controller.colorByType(widget.entrylist[index].type),
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
