import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final double balance;
  final String userId;
  final String userName;
  UserData({
    this.balance = 0.0,
    required this.userId,
    required this.userName,
  });

  UserData copyWith({
    double? balance,
    String? userId,
    String? userName,
  }) {
    return UserData(
      balance: balance ?? this.balance,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'balance': balance,
      'userId': userId,
      'userName': userName,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      balance: map['balance'] as double,
      userId: map['userId'] as String,
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppUser(balance: $balance, userId: $userId, userName: $userName)';

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.balance == balance &&
        other.userId == userId &&
        other.userName == userName;
  }

  @override
  int get hashCode => balance.hashCode ^ userId.hashCode ^ userName.hashCode;
}
