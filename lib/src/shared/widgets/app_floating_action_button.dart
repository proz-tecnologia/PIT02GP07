import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';

import '../../model/transaction_model.dart';
import '../../pages/home/controller/home_cubit.dart';



class CustomFloatingActionButton extends StatelessWidget {
    const CustomFloatingActionButton({
  Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      child: const Icon(Icons.add),
      distance: 54.0,
      children: [
        FloatingActionButton.small(
          heroTag: '1',
          onPressed: () async {
            await Modular.to.pushNamed(
              '/home/add',
              arguments: {
                'type': TransactionType.expense,
                'categories': Modular.get<HomeCubit>().userData!.categories,
              },
            );
            Modular.get<HomeCubit>().getUserData();
          },
          backgroundColor: AppColors.lightRed,
          child: const Icon(Icons.money_off_rounded),
        ),
        FloatingActionButton.small(
          heroTag: '2',
          onPressed: () async {
            await Modular.to.pushNamed(
              '/home/add',
              arguments: {
                'type': TransactionType.revenue,
                'categories': Modular.get<HomeCubit>().userData!.categories,
              },
            );
            Modular.get<HomeCubit>().getUserData();
          },
          backgroundColor: AppColors.lightGreen,
          child: const Icon(Icons.attach_money_rounded),
        ),
      ],
    );
  }
}
