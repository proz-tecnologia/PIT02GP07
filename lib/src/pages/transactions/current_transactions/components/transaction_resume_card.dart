import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../shared/widgets/wallet_type_widget.dart';

class TransactionResumeCard extends StatelessWidget {
  final double revenueValue;
  final double expenseValue;

  const TransactionResumeCard({
    Key? key,
    required this.revenueValue,
    required this.expenseValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const WalletTypeWidget(
          icon: Icons.arrow_circle_up_outlined,
          colorIcon: AppColors.iceWhite,
          backgroundColor: AppColors.mediumGreen,
          //value: revenueValue.toStringAsFixed(2),
          type: 'Receitas',
          style: AppTextStyle.mediumWhite,
        ),
        const WalletTypeWidget(
          icon: Icons.arrow_circle_down_outlined,
          colorIcon: AppColors.iceWhite,
          backgroundColor: AppColors.lightRed,
          //value: expenseValue.toStringAsFixed(2),
          type: 'Despesas',
          style: AppTextStyle.mediumWhite,
        ),
      ],
    );
  }
}
