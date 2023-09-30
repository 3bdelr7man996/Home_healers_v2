class reservationModel {
  reservationModel({
    required this.success,
  });
  late final String success;

  reservationModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    return _data;
  }
}
