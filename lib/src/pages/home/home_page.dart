import 'package:flutter/material.dart';
import 'package:pit02gp07/src/model/model_page_view.dart';
import '../../shared/widget/app_floating_action_button.dart';
import '../../shared/widget/app_top_bar.dart';
import '../../shared/widget/app_nav_bar.dart';
import 'page_view/user_card/user_card_screen.dart';
import 'page_view/home/home_screen.dart';
import 'page_view/transactions/transactions_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ModelPageView(
            page: HomeScreen(),
          ),
          ModelPageView(
            page: TransactionsScreen(),
          ),
          ModelPageView(
            page: UserCardScreen(),
          ),
        ],
      ),
      floatingActionButton: const AppFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: AppNavBar(
        pageController: pageController,
      ),
    );
  }
}
