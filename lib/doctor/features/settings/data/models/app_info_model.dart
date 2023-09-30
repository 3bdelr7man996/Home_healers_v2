class AppInfoModel {
  bool? success;
  InfoData? data;
  String? message;

  AppInfoModel({this.success, this.data, this.message});

  AppInfoModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = json?['data'] != null ? InfoData.fromJson(json?['data']) : null;
    message = json?['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class InfoData {
  int? id;
  String? siteName;
  String? email;
  String? mobile;
  String? tw;
  String? insta;
  String? fb;
  String? youtube;
  String? snap;
  String? whats;
  String? policy;
  int? vat;
  int? fees;
  String? privacy;
  String? terms;
  String? createdAt;
  String? updatedAt;

  InfoData(
      {this.id,
      this.siteName,
      this.email,
      this.mobile,
      this.tw,
      this.insta,
      this.fb,
      this.youtube,
      this.snap,
      this.whats,
      this.policy,
      this.vat,
      this.fees,
      this.privacy,
      this.terms,
      this.createdAt,
      this.updatedAt});

  InfoData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    siteName = json?['site_name'];
    email = json?['email'];
    mobile = json?['mobile'];
    tw = json?['tw'];
    insta = json?['insta'];
    fb = json?['fb'];
    youtube = json?['youtube'];
    snap = json?['snap'];
    whats = json?['whats'];
    policy = json?['policy'];
    vat = json?['vat'];
    fees = json?['fees'];
    privacy = json?['privacy'];
    terms = json?['terms'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site_name'] = siteName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['tw'] = tw;
    data['insta'] = insta;
    data['fb'] = fb;
    data['youtube'] = youtube;
    data['snap'] = snap;
    data['whats'] = whats;
    data['policy'] = policy;
    data['vat'] = vat;
    data['fees'] = fees;
    data['privacy'] = privacy;
    data['terms'] = terms;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
