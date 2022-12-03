

import 'package:flutter/cupertino.dart';
import 'package:pit02gp07/src/model/expenses_model.dart';

class HomeController {
  final typeList = <String>["Despesa", "Receita"];
  final categoriesList = <String>["Alimentação", "Educação"];
  final accountTypeList = <String>["Carteira", "Cartão"];

  final entryList = <ExpenseModel>[];
  int get entryListLength => entryList.length;

  var expensesValue = ValueNotifier<double>(0.0);
  var revenuesValue = ValueNotifier<double>(0.0);
  var balanceValue = ValueNotifier<double>(0.0);

  void addEntryIntoList(ExpenseModel expenseModel) {
    entryList.add(expenseModel);
    updateExpensesValue(
        expenseModel.value); //todo implementar updateRevenuesValue()
    updateBalanceValue();
  }

  void updateExpensesValue(value) {
    expensesValue.value = value;
  }

  void updateRevenuesValue(value) {
    revenuesValue.value = value;
  }

  void updateBalanceValue() {
    balanceValue.value = revenuesValue.value - expensesValue.value;
  }
}
