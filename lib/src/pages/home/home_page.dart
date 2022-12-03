// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../shared/widget/app_floating_action_button.dart';
import '../../shared/widget/app_nav_bar.dart';
import '../../shared/widget/app_top_bar.dart';
import '../add_transaction/add_transactions.dart';
import 'components/page_view_widget.dart';
import 'home_screen.dart';
import '../transaction/transactions_screen.dart';
import 'cards/user_card/user_card_screen.dart';
import 'page_view/home/home_controller.dart';

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

  // @override
  // void initState() {
  //   controller.balanceValue.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

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
                  revenueValue: controller.expensesValue.value,
                  expenseValue: controller.revenuesValue.value,
                  balanceValue: controller.balanceValue.value,
                ),
              );
            },
          ),
          PageViewWidget(
            page: TransactionsScreen(
              expenseValue: '',
              entrylist: controller.entryList,
              entryListLength: controller.entryListLength,
              revenueValue: '',
            ),
          ),
          const PageViewWidget(
            page: UserCardScreen(),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: (() async {
          log('Botão Adicionar');
          controller.addEntryIntoList(
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTransactions(
                  typeList: controller.typeList,
                  categoriesList: controller.categoriesList,
                  accountTypeList: controller.accountTypeList,
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
