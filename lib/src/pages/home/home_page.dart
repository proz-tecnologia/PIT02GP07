// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import '../../shared/widget/app_floating_action_button.dart';
import '../../shared/widget/app_nav_bar.dart';
import '../../shared/widget/app_top_bar.dart';
import 'components/page_view_widget.dart';
import 'home_screen.dart';
import '../transaction/transactions_screen.dart';
import 'cards/user_card/user_card_screen.dart';

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
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: widget.title,
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PageViewWidget(
            page: HomeScreen(),
          ),
          PageViewWidget(
            page: TransactionsScreen(),
          ),
          PageViewWidget(
            page: UserCardScreen(),
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: AppNavBar(pageController: pageController),
    );
  }
}
