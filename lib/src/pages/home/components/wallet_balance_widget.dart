import 'package:flutter/material.dart';
import 'package:pit02gp07/src/shared/utils/formatters.dart';

import '../../../core/theme/app_text_style.dart';
import 'home_state_success.dart';

class WalletBalanceWidget extends StatelessWidget {

 const WalletBalanceWidget({
  Key? key,
  required this.widget,
 }) : super(key: key);

 final HomeStateSuccessWidget widget;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Center(
              child: Text(
                Formatters.formatToReal(widget.state.user.balance),
                style: AppTextStyle.smallWhite,
              ),
            ),
            const Text('Saldo',
            style: AppTextStyle.extraSmallWhite,)
          ],
        ),
      ],
    );
  }
}
