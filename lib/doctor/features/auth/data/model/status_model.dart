class StatusModel {
  StatusModel({
    required this.success,
    required this.statusData,
    required this.message,
  });
  late final bool success;
  late final List<StatusData> statusData;
  late final String message;

  StatusModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    statusData =
        List.from(json?['data']).map((e) => StatusData.fromJson(e)).toList();
    message = json?['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = statusData.map((e) => e.toJson()).toList();
    data['message'] = message;
    return data;
  }
}

class StatusData {
  StatusData({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
  });
  late final int id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? status;

  StatusData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['status'] = status;
    return data;
  }
}
