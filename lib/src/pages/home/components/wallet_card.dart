// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pit02gp07/src/pages/home/components/wallet_balance_widget.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../shared/widgets/wallet_type_widget.dart';

class WalletCard extends StatelessWidget {
  final double revenueValue;
  final double expenseValue;
  final double balanceValue;

  const WalletCard({
    Key? key,
    required this.revenueValue,
    required this.expenseValue,
    required this.balanceValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
             WalletBalanceWidget(
              value: balanceValue.toStringAsFixed(2),
              type: 'Saldo',
              style: AppTextStyle.extraLargeWhite,
              rowAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WalletTypeWidget(
                  icon: Icons.arrow_circle_up_outlined,
                  colorIcon: AppColors.iceWhite,
                  backgroundColor: AppColors.mediumGreen,
                  value: revenueValue.toStringAsFixed(2),
                  type: 'Receitas',
                  style: AppTextStyle.mediumWhite,
                  columnAlignment: CrossAxisAlignment.start,
                ),
                WalletTypeWidget(
                  icon: Icons.arrow_circle_down_outlined,
                  colorIcon: AppColors.iceWhite,
                  backgroundColor: AppColors.lightRed,
                  value: expenseValue.toStringAsFixed(2),
                  type: 'Despesas',
                  style: AppTextStyle.mediumWhite,
                  columnAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
