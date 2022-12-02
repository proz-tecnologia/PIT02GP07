import 'package:flutter/cupertino.dart';
import 'package:pit02gp07/src/model/expenses_model.dart';

class HomeController {
  
  final typeList = <String>["Despesa", "Receita"];
  final categoriesList = <String>["Alimentação", "Educação"];
  final accountTypeList = <String>["Carteira", "Cartão"];

  final expensesList = <ExpenseModel>[];
  var expensesValue = ValueNotifier<double>(0.0);
  var revenuesValue = ValueNotifier<double>(0.0);
  var balanceValue = ValueNotifier<double>(0.0);

  void addExpenseList(ExpenseModel newValue) {
    expensesList.add(newValue);
  }
}
