import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';
import 'package:pit02gp07/src/model/transaction_model.dart';

class FinanceOperationWidget extends StatelessWidget {
  final TransactionModel transaction;

  const FinanceOperationWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  String get textType =>
      transaction.type == TransactionType.expense ? 'Despesa' : 'Receita';

  Color get color => transaction.type == TransactionType.expense
      ? AppColors.lightRed
      : AppColors.lightGreen;

  String get value =>
      'R\$ ${transaction.value.toStringAsFixed(2).replaceFirst('.', ',')}';

  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(transaction.createdAt!.toDate());

  String get formattedTime =>
      DateFormat('h:mm a').format(transaction.createdAt!.toDate());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.mediumGray,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(textType),
                  ],
                ),
                Column(
                  children: [
                    Text(formattedDate),
                    Text(formattedTime),
                  ],
                ),
              ],
            ),
            SizedBox(
              key: Key('SPACER_DATE_NAME_${transaction.id.toString()}'),
              height: 8.0,
            ),
            const Divider(),
            const SizedBox(height: 8.0),
            Text(
              transaction.name,
              style: AppTextStyle.mediumWhite,
            ),
            const SizedBox(height: 8.0),
            Text(
              transaction.category,
              style: AppTextStyle.smallWhite,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  value,
                  style: AppTextStyle.mediumWhiteBold,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
