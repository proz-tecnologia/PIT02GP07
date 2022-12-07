// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../shared/widget/app_floating_action_button.dart';
import '../../shared/widget/app_nav_bar.dart';
import '../../shared/widget/app_top_bar.dart';
import '../add_transaction/add_transactions.dart';
import '../components/page_view_widget.dart';
import 'home_screen.dart';
import '../transaction/transaction_screen.dart';
import '../credit_card/credit_card_screen.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: widget.title,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ValueListenableBuilder<double>(
            valueListenable: controller.balanceValue,
            builder: (context, value, child) {
              return PageViewWidget(
                page: HomeScreen(
                  revenueValue: controller.revenuesValue.value,
                  expenseValue: controller.expensesValue.value,
                  balanceValue: controller.balanceValue.value,
                  expenseInCreditCard: controller.expenseInCreditCard.value,
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: controller.balanceValue,
            builder: ((context, value, child) {
              return PageViewWidget(
                page: TransactionsScreen(
                  expenseValue: controller.expensesValue.value,
                  revenueValue: controller.revenuesValue.value,
                  entrylist: controller.entryList,
                  entryListLength: controller.entryListLength,
                ),
              );
            }),
          ),
          ValueListenableBuilder<double>(
            valueListenable: controller.expenseInCreditCard,
            builder: ((context, value, child) {
              return PageViewWidget(
                page: CreditCardScreen(
                  expenseInCreditCard: controller.expenseInCreditCard.value,
                  expenseInCreditCardListLength: controller.expenseInCreditCardListLength, 
                  expenseInCreditCardList: controller.expenseInCreditCardList,

                ),
              );
            }),
          )
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: (() async {
          controller.addNewEntry(
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTransactions(
                  typeList: controller.typeList,
                  categoriesList: controller.categoriesList,
                  accountOriginList: controller.accountOriginList,
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: AppNavBar(pageController: pageController),
    );
  }
}
