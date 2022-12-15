// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';
//import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';
import '../../widgets/app_floating_action_button.dart';
import '../../widgets/app_nav_bar.dart';

import '../transactions/add_transaction/add_transactions.dart';
import '../../widgets/page_view_widget.dart';
import 'components/home_screen.dart';
import '../transactions/current_transactions/transaction_screen.dart';
import '../credit_card/credit_card_screen.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => Modular.get<HomeCubit>()..getUserData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeStateSuccess) {
              return Flex(
                direction: Axis.vertical,
                children: [
                  PageView(
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
                              expenseInCreditCard:
                                  controller.expenseInCreditCard.value,
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
                              expenseInCreditCard:
                                  controller.expenseInCreditCard.value,
                              expenseInCreditCardListLength:
                                  controller.expenseInCreditCardListLength,
                              expenseInCreditCardList:
                                  controller.expenseInCreditCardList,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              );
            }

            return Container();
          },
        ),
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
