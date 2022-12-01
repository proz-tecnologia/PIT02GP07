import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import 'components/wallet_type_widget.dart';

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
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                WalletTypeWidget(
                  icon: Icons.arrow_circle_up_outlined,
                  colorIcon: AppColors.iceWhite,
                  backgroundColor: AppColors.mediumGreen,
                  value: '280,00',
                  type: 'Receitas',
                  style: AppTextStyle.mediumWhite,
                  columnAlignment: CrossAxisAlignment.start,
                ),
                WalletTypeWidget(
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
