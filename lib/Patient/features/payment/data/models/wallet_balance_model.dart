class WalletBalanceModel {
  int? userId;
  String? name;
  int? points;
  double? pointsInSAR;
  String? walletBalance;

  WalletBalanceModel({
    this.userId,
    this.name,
    this.points,
    this.pointsInSAR,
    this.walletBalance,
  });

  WalletBalanceModel.fromJson(Map<String, dynamic>? json) {
    userId = json?['user_id'];
    name = json?['name'];
    points = json?['points'];
    pointsInSAR = json?['pointsInSAR'];
    walletBalance = json?['wallet_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['points'] = this.points;
    data['pointsInSAR'] = this.pointsInSAR;
    data['wallet_balance'] = this.walletBalance;

    return data;
  }
}
