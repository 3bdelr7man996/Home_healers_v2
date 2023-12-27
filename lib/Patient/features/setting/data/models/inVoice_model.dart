class inVoiceModel {
  bool? success;
  Data? data;
  String? message;

  inVoiceModel({this.success, this.data, this.message});

  inVoiceModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = json?['data'] != null ? new Data.fromJson(json?['data']) : null;
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['success'] = this.success;
    if (this.data != null) {
      data?['data'] = this.data!.toJson();
    }
    data?['message'] = this.message;
    return data;
  }
}

class Data {
  String? commercialRecord;
  String? taxNumber;
  String? email;
  String? phone;
  String? link;

  Data(
      {this.commercialRecord,
      this.taxNumber,
      this.email,
      this.phone,
      this.link});

  Data.fromJson(Map<String, dynamic>? json) {
    commercialRecord = json?['CommercialRecord'];
    taxNumber = json?['TaxNumber'];
    email = json?['email'];
    phone = json?['phone'];
    link = json?['link'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['CommercialRecord'] = this.commercialRecord;
    data?['TaxNumber'] = this.taxNumber;
    data?['email'] = this.email;
    data?['phone'] = this.phone;
    data?['link'] = this.link;
    return data;
  }
}
