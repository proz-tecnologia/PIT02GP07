import '../../../../model/expenses_model.dart';

class AddTransactionsController {
  ExpenseModel addEntry({
    required String name,
    required String stringValue,
    required String type,
    required String category,
    required String accountOrigin
  }) {
    final value = double.parse(stringValue);
    final expense = ExpenseModel(
      name: name,
      value: value,
      type: type,
      category: category,
      accountOrigin: accountOrigin,
    );
    return expense;
  }
}
