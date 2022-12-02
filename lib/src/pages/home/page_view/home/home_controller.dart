import 'package:pit02gp07/src/model/expenses_model.dart';

class HomeController {
  
  final typeList = <String>["Despesa", "Receita"];
  final categoriesList = <String>["Alimentação", "Educação"];
  final accountTypeList = <String>["Carteira", "Cartão"];

  final expensesList = <ExpenseModel>[];
  
  void addExpenseList(ExpenseModel newValue) {
    expensesList.add(newValue);
  }
}
