import 'package:flutter/cupertino.dart';
import 'package:pit02gp07/src/model/expenses_model.dart';

class HomeController {
  final typeList = <String>["Despesa", "Receita"];
  final categoriesList = <String>["Alimentação", "Educação", "Sálario"];
  final accountOriginList = <String>["Carteira", "Cartão"];

  final entryList = <ExpenseModel>[];
  int get entryListLength => entryList.length;

  final expenseInCreditCardList = <ExpenseModel>[];
  int get expenseInCreditCardListLength => expenseInCreditCardList.length;

  var expensesValue = ValueNotifier<double>(0.0);
  var revenuesValue = ValueNotifier<double>(0.0);
  var balanceValue = ValueNotifier<double>(0.0);
  var expenseInCreditCard = ValueNotifier<double>(0.0);

  void addNewEntry(ExpenseModel? expenseModel) {
    if (expenseModel != null) {
      entryList.add(expenseModel);
      addExpenseInCreditCard(expenseModel);
      updateValueByType(expenseModel);
    }
  }

  void updateExpensesValue(value) {
    expensesValue.value += value;
  }

  void updateRevenuesValue(value) {
    revenuesValue.value += value;
  }

  void updateBalanceValue() {
    balanceValue.value = revenuesValue.value - expensesValue.value;
  }

  updateExpenseInCreditCard(ExpenseModel expenseModel) {
    expenseInCreditCard.value += expenseModel.value;
  }

  void updateValueByType(ExpenseModel expenseModel) {
    if (expenseModel.type == "Despesa") {
      updateExpensesValue(expenseModel.value);
    } else if (expenseModel.type == "Receita") {
      updateRevenuesValue(expenseModel.value);
    }
    updateBalanceValue();
  }

  void addExpenseInCreditCard(ExpenseModel expenseModel) {
    if (expenseModel.accountOrigin == "Cartão") {
      expenseInCreditCardList.add(expenseModel);
      updateExpenseInCreditCard(expenseModel);
    }
  }
}
