import '../../../diagnose_report/data/models/diagonse_form_model.dart';
import 'reservations_model.dart';

class UserReservation {
  int? id;
  String? name;
  String? mobile;
  String? image;
  String? fcmToken;
  String? email;
  String? gender;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  List<DoctorReports>? doctorReports;
  List<DiagnoseForm>? diagnoseForms;
  List<Reports>? reports;

  UserReservation(
      {this.id,
      this.name,
      this.mobile,
      this.image,
      this.fcmToken,
      this.email,
      this.gender,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.doctorReports,
      this.diagnoseForms,
      this.reports});

  UserReservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
    mobile = json['mobile'] ?? "";
    image = json['image'] ?? "";
    fcmToken = json['fcm_token'];
    email = json['email'] ?? "";
    gender = json['gender'] ?? "";
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    if (json['doctor_reports'] != null) {
      reports = [];
      json['doctor_reports'].forEach((v) {
        doctorReports?.add(DoctorReports.fromJson(v));
      });
    }

    if (json['diagnose_forms'] != null) {
      diagnoseForms = <DiagnoseForm>[];
      json['diagnose_forms'].forEach((v) {
        diagnoseForms!.add(DiagnoseForm.fromJson(v));
      });
    }
    if (json['reports'] != null) {
      reports = <Reports>[];
      json['reports'].forEach((v) {
        reports!.add(Reports.fromJson(v));
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (doctorReports != null) {
      data['doctor_reports'] = doctorReports!.map((v) => v.toJson()).toList();
    }
    if (diagnoseForms != null) {
      data['diagnose_forms'] = diagnoseForms!.map((v) => v.toJson()).toList();
    }
    if (reports != null) {
      data['reports'] = reports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reports {
  int? id;
  String? repTitle;
  String? repImage;
  int? userId;
  String? createdAt;

  Reports({this.id, this.repTitle, this.repImage, this.userId, this.createdAt});

  Reports.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    repTitle = json?['rep_title'];
    repImage = json?['rep_image'];
    userId = json?['user_id'];
    createdAt = json?['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rep_title'] = repTitle;
    data['rep_image'] = repImage;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    return data;
  }
}
