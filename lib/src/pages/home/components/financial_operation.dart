import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';
import 'package:pit02gp07/src/model/transaction_model.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository_impl.dart';

class FinanceOperationWidget extends StatefulWidget {
  final TransactionModel transaction;

  const FinanceOperationWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  State<FinanceOperationWidget> createState() => _FinanceOperationWidgetState();
}

class _FinanceOperationWidgetState extends State<FinanceOperationWidget> {
  final cubit = Modular.get<HomeRepositoryImpl>();

  String get textType => widget.transaction.type == TransactionType.expense
      ? 'Despesa'
      : 'Receita';

  Color get color => widget.transaction.type == TransactionType.expense
      ? AppColors.lightRed
      : AppColors.lightGreen;

  String get value =>
      'R\$ ${widget.transaction.value.toStringAsFixed(2).replaceFirst('.', ',')}';

  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(widget.transaction.createdAt!.toDate());

  String get formattedTime =>
      DateFormat('h:mm a').format(widget.transaction.createdAt!.toDate());

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
              key:
                  Key('SPACER_DATE_NAME_${widget.transaction.id.toString()}'),
              height: 8.0,
            ),
            const Divider(),
            const SizedBox(height: 8.0),
            Text(
              widget.transaction.name,
              style: AppTextStyle.mediumWhite,
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.transaction.category,
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
