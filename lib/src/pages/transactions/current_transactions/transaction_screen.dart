import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';
import 'package:pit02gp07/src/pages/transactions/current_transactions/components/transaction_state_success.dart';
import 'package:pit02gp07/src/shared/utils/formatters.dart';
import '../../../core/theme/app_colors.dart';
import '../../home/components/home_state_empty.dart';

class TransactionsScreen extends StatefulWidget {
  final HomeStateSuccess state;
  final List<String> selectedCategories;
  final Function(String value) onSelectItem;
  const TransactionsScreen({
    super.key,
    required this.state,
    required this.selectedCategories,
    required this.onSelectItem,
  });

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.compare_arrows_outlined),
    label: 'Transações',
    tooltip: 'Ir para Transações',
  );

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' Seu saldo é ${Formatters.formatToReal(widget.state.user.balance)}',
          style: const TextStyle(color: AppColors.iceWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          color: AppColors.darkGray,
          child: widget.state.transactions.isEmpty
              ? const HomeEmptyStateWidget()
              : TransactionStateSuccessWidget(
                  onSelectItem: widget.onSelectItem,
                  selectedCategories: widget.selectedCategories,
                  state: widget.state,
                ),
        ),
      ),
    );
  }
}
