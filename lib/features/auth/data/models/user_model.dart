import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:dr/doctor/features/diagnose_report/data/models/diagonse_form_model.dart';
import 'package:dr/doctor/features/home/data/models/reservation_details_model.dart';

class UserModel {
  UserData? success;

  UserModel({this.success});

  UserModel.fromJson(Map<String, dynamic>? json) {
    success =
        json?['success'] != null ? UserData.fromJson(json?['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? mobile;
  String? image;
  String? fcmToken;
  String? email;
  String? gender;
  int? cityId;
  String? token;
  Advertiser? advertiser;
  List<DoctorReports>? doctorReports;
  List<DiagnoseForm>? diagnoseForms;

  UserData(
      {this.id,
      this.name,
      this.mobile,
      this.image,
      this.fcmToken,
      this.email,
      this.gender,
      this.cityId,
      this.token,
      this.advertiser,
      this.doctorReports,
      this.diagnoseForms});

  UserData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    mobile = json?['mobile'];
    image = json?['image'];
    fcmToken = json?['fcm_token'];
    email = json?['email'];
    gender = json?['gender'];
    cityId = json?['city_id'];
    token = json?['token'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
    if (json?['doctor_reports'] != null) {
      doctorReports = <DoctorReports>[];
      json?['doctor_reports'].forEach((v) {
        doctorReports!.add(DoctorReports.fromJson(v));
      });
    }
    if (json?['diagnose_forms'] != null) {
      diagnoseForms = <DiagnoseForm>[];
      json?['diagnose_forms'].forEach((v) {
        diagnoseForms!.add(DiagnoseForm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['image'] = image;
    data['fcm_token'] = fcmToken;
    data['email'] = email;
    data['gender'] = gender;
    data['city_id'] = cityId;
    data['token'] = token;
    data['advertiser'] = advertiser?.toJson();
    if (doctorReports != null) {
      data['doctor_reports'] = doctorReports!.map((v) => v.toJson()).toList();
    }
    if (diagnoseForms != null) {
      data['diagnose_forms'] = diagnoseForms!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  UserData copyWith({
    int? id,
    String? name,
    String? mobile,
    String? image,
    String? fcmToken,
    String? email,
    String? gender,
    int? cityId,
    String? token,
    Advertiser? advertiser,
    List<DoctorReports>? doctorReports,
    List<DiagnoseForm>? diagnoseForms,
  }) =>
      UserData(
        advertiser: advertiser ?? this.advertiser,
        name: name ?? this.name,
        email: email ?? this.email,
        id: id ?? this.id,
        image: image ?? this.image,
        mobile: mobile ?? this.mobile,
        fcmToken: fcmToken ?? this.fcmToken,
      );
}
