class User {
  String? id;
  String? userName;
  String? phoneNumber;
  String? email;
  bool? isVerified;
  double? balance;
  double? topUpAmount;

  User({
    this.id,
    this.isVerified,
    this.balance,
    this.userName,
    this.email,
    this.phoneNumber,
    this.topUpAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'email': email,
      'isVerified': isVerified,
      'balance': balance,
      'topUpAmount': topUpAmount,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      isVerified: json['isVerified'],
      balance: json['balance'],
      topUpAmount: json['topUpAmount'],
    );
  }
}
