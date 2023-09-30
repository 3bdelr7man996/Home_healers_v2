class DiagnoseForm {
  int? id;
  int? reservationId;
  String? section1;
  String? section2;
  String? section3;
  String? section4;
  String? section5;
  String? section6;
  String? section7;
  String? section8;
  String? section9;
  String? section10;
  String? section11;
  String? section12;
  List<String>? treatment;
  String? createdAt;

  DiagnoseForm({
    this.id,
    this.reservationId,
    this.section1,
    this.section2,
    this.section3,
    this.section4,
    this.section5,
    this.section6,
    this.section7,
    this.section8,
    this.section9,
    this.section10,
    this.section11,
    this.section12,
    this.treatment,
    this.createdAt,
  });

  DiagnoseForm.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    reservationId = json?['reservation_id'];
    section1 = json?['section_1'];
    section2 = json?['section_2'];
    section3 = json?['section_3'];
    section4 = json?['section_4'];
    section5 = json?['section_5'];
    section6 = json?['section_6'];
    section7 = json?['section_7'];
    section8 = json?['section_8'];
    section9 = json?['section_9'];
    section10 = json?['section_10'];
    section11 = json?['section_11'];
    section12 = json?['section_12'];
    treatment =
        json?['treatment'] != null ? json!['treatment'].cast<String>() : [];
    createdAt = json?['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reservation_id'] = reservationId;
    data['section_1'] = section1;
    data['section_2'] = section2;
    data['section_3'] = section3;
    data['section_4'] = section4;
    data['section_5'] = section5;
    data['section_6'] = section6;
    data['section_7'] = section7;
    data['section_8'] = section8;
    data['section_9'] = section9;
    data['section_10'] = section10;
    data['section_11'] = section11;
    data['section_12'] = section12;
    data['treatment'] = treatment;
    data['created_at'] = createdAt;
    return data;
  }
}
