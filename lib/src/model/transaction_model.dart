import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

enum TransactionType { revenue, expense }

class TransactionModel {
  String? id;
  TransactionType type;
  double value;
  String name;
  String category;
  String? userId;
  Timestamp? createdAt;

  String get dateFormatted => createdAt!.toDate().toLocal().toString();

  TransactionModel({
    required this.type,
    required this.value,
    required this.name,
    required this.category,
    this.createdAt,
    this.userId,
    this.id,
  }) {
    createdAt ??= Timestamp.now();
  }

  TransactionModel copyWith({
    double? value,
    String? name,
    String? category,
    TransactionType? type,
    String? id,
    String? userId,
  }) {
    return TransactionModel(
      type: type ?? this.type,
      value: value ?? this.value,
      name: name ?? this.name,
      category: category ?? this.category,
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'name': name,
      'category': category,
      'type': type.name,
      'userId': userId,
      'id': id,
      'createdAt': createdAt,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      value: map['value']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
     type: map['type'] == 'revenue'
          ? TransactionType.revenue
          : TransactionType.expense,
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Transaction(value: $value, name: $name, category: $category, type: ${type.name})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.value == value &&
        other.name == name &&
        other.category == category;
  }

  @override
  int get hashCode => value.hashCode ^ name.hashCode ^ category.hashCode;
}
