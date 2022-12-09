// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../widgets/app_floating_action_button.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/app_top_bar.dart';
import '../transactions/add_transaction/add_transactions.dart';
import '../widgets/page_view_widget.dart';
import 'components/home_screen.dart';
import '../transactions/current_transactions/transaction_screen.dart';
import '../credit_card/credit_card_screen.dart';
import 'controller/home_controller.dart';

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
