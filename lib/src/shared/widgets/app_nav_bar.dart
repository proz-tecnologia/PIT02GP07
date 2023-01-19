import 'package:flutter/material.dart';
import 'package:pit02gp07/src/pages/credit_card/add_new_card.dart';
import 'package:pit02gp07/src/pages/credit_card/credit_card_screen.dart';
import '../../pages/home/home_page.dart';
import '../../pages/transactions/current_transactions/transaction_screen.dart';

class AppNavBar extends StatefulWidget {
  final PageController pageController;

  const AppNavBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (page) {
        setState(
          () {
            currentPage = page;
            widget.pageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          },
        );
      },
      currentIndex: currentPage,
      items: const [
        HomePage.item,
        TransactionsScreen.item,
        CreditCardScreen.item,
      ],
    );
  }
}
