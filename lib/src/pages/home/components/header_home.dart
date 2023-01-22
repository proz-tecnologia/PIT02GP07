import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';

import '../../../shared/utils/formatters.dart';
import 'home_state_success.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomeStateSuccessWidget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.darkGreen,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await Modular.to.pushNamed('/login');
                  },
                  icon: const Icon(Icons.arrow_back_outlined),
                  tooltip: 'Logout',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                      'Olá, seja bem vindo(a),  ${widget.state.user.userName}',
                      style: AppTextStyle.mediumWhite),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '    Seu saldo é: ',
                  style: TextStyle(
                    color: AppColors.iceWhite,
                  ),
                ),
                Text(
                  Formatters.formatToReal(widget.state.user.balance),
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
