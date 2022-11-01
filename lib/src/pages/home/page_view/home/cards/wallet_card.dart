import 'package:flutter/material.dart';
import 'package:pit02gp07/src/shared/constants/app_text_style.dart';
import '../../../../../model/model_wallet_balance.dart';
import '../../../../../model/model_wallet_type.dart';
import '../../../../../shared/constants/app_colors.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
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
            const ModelWalletBalance(
              value: '246,58',
              type: 'Saldo',
              style: AppTextStyle.extraLargeWhite,
              rowAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ModelWalletType(
                  icon: Icons.arrow_circle_up_outlined,
                  colorIcon: AppColors.iceWhite,
                  backgroundColor: AppColors.mediumGreen,
                  value: '280,00',
                  type: 'Receitas',
                  style: AppTextStyle.mediumWhite,
                  columnAlignment: CrossAxisAlignment.start,
                ),
                ModelWalletType(
                  icon: Icons.arrow_circle_down_outlined,
                  colorIcon: AppColors.iceWhite,
                  backgroundColor: AppColors.lightRed,
                  value: '33,42',
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
