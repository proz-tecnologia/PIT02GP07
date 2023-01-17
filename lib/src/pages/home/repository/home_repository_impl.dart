import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pit02gp07/src/model/transaction_model.dart';
import 'package:pit02gp07/src/pages/home/repository/home_repository.dart';

import '../../../model/user_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  CollectionReference get _users =>
      FirebaseFirestore.instance.collection('users');
  CollectionReference get _transactions =>
      FirebaseFirestore.instance.collection('transactions');

  @override
  Future<UserData> getUserData({
    required String userId,
  }) async {
    final response = await _users.where('userId', isEqualTo: userId).get();

    final document = response.docs.first.data() as Map<String, dynamic>;

    final userData = UserData.fromMap(document);

    return userData;
  }

  @override
  Future<void> addTransaction({
    required TransactionModel transaction,
  }) async {
    final response = await _transactions.add(transaction.toMap());

    await _transactions.doc(response.id).update(
      {
        'id': response.id,
      },
    );
  }


  @override
  Future<void> updateBalance({
    required UserData userData,
  }) async =>
      await _users.doc(userData.userId).update({
        'balance': userData.balance,
      });

  @override
  Future<List<TransactionModel>> getTransaction({
    required String userId,
    List<String>? categories,
    DateTime? initialDate,
    DateTime? endDate,
  }) async {
    var draw = _transactions.where('userId', isEqualTo: userId);
    if (categories?.isNotEmpty ?? false) {
      draw = draw.where('category', whereIn: categories);
    }
    if (initialDate != null) {
      draw = draw.where('createdAt',
          isGreaterThan: Timestamp.fromDate(DateTime(2022, 12, 21, 0, 0)));
    }
    if (endDate != null) {
      draw = draw.where('createdAt',
          isLessThan: Timestamp.fromDate(DateTime(2022, 12, 21, 0, 0)));
    }

    final firebaseTransaction =
        await draw.orderBy('createdAt', descending: true).get();

    final transaction = firebaseTransaction.docs
        .map(
          (e) => TransactionModel.fromMap(
            Map<String, dynamic>.from(
              e.data() as Map<String, dynamic>,
            ),
          ),
        )
        .toList();

    return transaction;
  }

  @override
  Future<void> deleteTransaction({
    required String id,
  }) async {
    await _transactions.doc(id).delete();
  }
  @override
  Future<void> addCategory(
      {required String category, required String userId}) async {
    await _users.doc(userId).update({
      'categories': FieldValue.arrayUnion([category]),
      'userName': 'Paula Franco',
    });
  }
}
