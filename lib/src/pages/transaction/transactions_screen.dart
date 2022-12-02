import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';

import 'package:pit02gp07/src/pages/home/cards/components/wallet_type_widget.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({
    super.key,
  });

  static const BottomNavigationBarItem item = BottomNavigationBarItem(
    icon: Icon(Icons.compare_arrows_outlined),
    label: 'Transações',
    tooltip: 'Ir para Transações',
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  WalletTypeWidget(
                      icon: Icons.arrow_circle_up_outlined,
                      colorIcon: AppColors.iceWhite,
                      backgroundColor: AppColors.mediumGreen,
                      value: '0,00',
                      type: 'Receitas',
                      style: AppTextStyle.mediumWhite),
                  SizedBox(
                    height: 12.0,
                  ),
                  WalletTypeWidget(
                      icon: Icons.arrow_circle_up_outlined,
                      colorIcon: AppColors.iceWhite,
                      backgroundColor: AppColors.lightRed,
                      value: '0,00',
                      type: 'Despesas',
                      style: AppTextStyle.mediumWhite)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
