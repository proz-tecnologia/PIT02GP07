import 'dart:convert';

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

  ExpenseModel copyWith({
    String? name,
    double? value,
    String? type,
    String? category,
    String? accountOrigin,
  }) {
    return ExpenseModel(
      name: name ?? this.name,
      value: value ?? this.value,
      type: type ?? this.type,
      category: category ?? this.category,
      accountOrigin: accountOrigin ?? this.accountOrigin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
      'type': type,
      'category': category,
      'accountOrigin': accountOrigin,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      name: map['name'] as String,
      value: map['value'] as double,
      type: map['type'] as String,
      category: map['category'] as String,
      accountOrigin: map['accountOrigin'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) => ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpenseModel(name: $name, value: $value, type: $type, category: $category, accountOrigin: $accountOrigin)';
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.value == value &&
      other.type == type &&
      other.category == category &&
      other.accountOrigin == accountOrigin;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      value.hashCode ^
      type.hashCode ^
      category.hashCode ^
      accountOrigin.hashCode;
  }
}
