import 'package:flutter/material.dart';
import '../../shared/constants/app_colors.dart';
import 'pages/account/account.dart';
import 'pages/initial/initial.dart';
import 'pages/movements/movements.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      ),
      bottomNavigationBar: StatefulBuilder(
        builder: ((context, setState) {
          return BottomNavigationBar(
            backgroundColor: AppColors.darkGray,
            unselectedItemColor: AppColors.iceWhite,
            selectedItemColor: AppColors.darkGold,
            onTap: (page) {
              setState(
                () {
                  currentPage = page;
                  pageController.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
              );
            },
            currentIndex: currentPage,
            items: const [
              Initial.item, 
              Moviments.item,
              Accounts.item,
            ],
          );
        }),
      ),
    );
  }
}
