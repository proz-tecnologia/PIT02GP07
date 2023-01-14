import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';
import '../../shared/widgets/app_floating_action_button.dart';
import '../../shared/widgets/app_nav_bar.dart';
import '../../shared/widgets/page_view_widget.dart';
import 'components/home_screen.dart';
import '../transactions/current_transactions/transaction_screen.dart';
import '../credit_card/credit_card_screen.dart';
import 'components/home_state_success.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  final controller = HomeController();
  List<String> selectedCategories = [];

  void addCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }

    Modular.get<HomeCubit>().getUserData(selectedCategories);
  }
 late final HomeStateSuccessWidget teste;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Modular.get<HomeCubit>()..getUserData(),
          child: RefreshIndicator(
            onRefresh: () => Modular.get<HomeCubit>().getUserData(),
            child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is HomeStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeStateSuccess) {
                return  PageView(

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
                 // ignore: unnecessary_type_check
                  HomeStateSuccessWidget(
                  state: state,
                  selectedCategories: selectedCategories,
                  onSelectItem: (value) => addCategory(value),
                ),
                  // ValueListenableBuilder(
                  //   valueListenable: controller.balanceValue,
                  //   builder: ((context, value, child) {
                  //     return PageViewWidget(
                  //       page: TransactionsScreen(
                  //         expenseValue: controller.expensesValue.value,
                  //         revenueValue: controller.revenuesValue.value,
                  //         entrylist: controller.entryList,
                  //         entryListLength: controller.entryListLength,
                  //       ),
                  //     );
                  //   }),
                  // ),
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
              );

            }
            return Container();
            },

            ),
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const CustomFloatingActionButton(),
      bottomNavigationBar: AppNavBar(pageController: pageController),
    );
  }
}
