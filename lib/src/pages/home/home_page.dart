import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/pages/credit_card/credit_card_screen.dart';
import 'package:pit02gp07/src/pages/home/controller/home_cubit.dart';
import 'package:pit02gp07/src/pages/home/state/home_state.dart';
import 'package:pit02gp07/src/pages/transactions/current_transactions/transaction_screen.dart';
import '../../shared/widgets/app_floating_action_button.dart';
import '../../shared/widgets/app_nav_bar.dart';

import 'components/home_state_success.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Inicial',
    tooltip: 'Ir para tela principal',
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();

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
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeStateSuccess) {
                  return PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      HomeStateSuccessWidget(
                        state: state,
                        selectedCategories: selectedCategories,
                        onSelectItem: (value) => addCategory(value),
                      ),
                      TransactionsScreen(
                        state: state,
                      ),
                      CreditCardScreen(
                        state: state,
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
