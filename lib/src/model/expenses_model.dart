// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExpenseModel {
  final String name;
  final double value;
  final String type;
  final String category;
  final String accountOrigin;

  const ExpenseModel({
    required this.name,
    required this.value,
    required this.type,
    required this.category,
    required this.accountOrigin,
  });
}
