class Beneficiary {
  String? nickname;
  String? phoneNumber;
  double? topUpAmount;

  Beneficiary({this.nickname, this.phoneNumber, this.topUpAmount});

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      nickname: json['nickname'],
      phoneNumber: json['phoneNumber'],
      topUpAmount: json['topUpAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'phoneNumber': phoneNumber,
      'topUpAmount': topUpAmount,
    };
  }
}
