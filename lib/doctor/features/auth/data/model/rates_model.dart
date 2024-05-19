import 'package:dr/doctor/features/auth/data/model/sign_up_adv_model.dart';

class Rates {
  int? id;
  int? advertiserId;
  int? userId;
  int? rate;
  String? message;
  String? status;
  User? user;

  Rates(
      {this.id,
      this.advertiserId,
      this.userId,
      this.rate,
      this.message,
      this.status,
      this.user});

  Rates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    advertiserId = json['advertiser_id'];
    userId = json['user_id'];
    rate = json['rate'];
    message = json['message'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['advertiser_id'] = this.advertiserId;
    data['user_id'] = this.userId;
    data['rate'] = this.rate;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
