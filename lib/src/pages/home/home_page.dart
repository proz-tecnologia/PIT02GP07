import 'package:flutter/material.dart';
import 'package:pit02gp07/src/model/model_page_view.dart';
import '../../shared/constants/app_colors.dart';
import 'page_view/user_card/user_card_screen.dart';
import 'page_view/home/home_screen.dart';
import 'page_view/transactions/transactions_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      ),
      bottomNavigationBar: StatefulBuilder(
        builder: ((context, setState) {
          return BottomNavigationBar(
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
              HomeScreen.item,
              TransactionsScreen.item,
              UserCardScreen.item,
            ],
          );
        }),
      ),
    );
  }
}
