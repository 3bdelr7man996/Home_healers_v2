class ReservationsStatusModel {
  ReservationsStatusModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool? success;
  late final List<ReservationStatus>? data;
  late final String? message;

  ReservationsStatusModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = List.from(json?['data'])
        .map((e) => ReservationStatus.fromJson(e))
        .toList();
    message = json?['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class ReservationStatus {
  ReservationStatus({
    required this.status,
    required this.count,
  });
  late final Status? status;
  late final int? count;

  ReservationStatus.fromJson(Map<String, dynamic>? json) {
    status = Status.fromJson(json?['status']);
    count = json?['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status?.toJson();
    _data['count'] = count;
    return _data;
  }
}

class Status {
  Status({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
  });
  late final int? id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? status;

  Status.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['status'] = status;
    return _data;
  }
}
