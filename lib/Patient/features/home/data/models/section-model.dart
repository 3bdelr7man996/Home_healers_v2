import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';

class SectionModel {
  SectionModel({
    required this.success,
    required this.advertisersList,
    required this.message,
  });
  late final bool success;
  late final List<Advertiser> advertisersList;
  late final String message;

  SectionModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    // advertisersList =
    //     List.from(json?['data']).map((e) => SectionData.fromJson(e)).toList();
    if (json?['data'] != null) {
      advertisersList = <Advertiser>[];
      json?['data'].forEach((v) {
        advertisersList.add(new Advertiser.fromJson(v));
      });
    }
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = advertisersList.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}
