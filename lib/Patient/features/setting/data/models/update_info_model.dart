import 'package:dr/features/auth/data/models/user_model.dart';

class UpdateInfoModel {
  UpdateInfoModel({
    required this.success,
  });
  late final UserData success;

  UpdateInfoModel.fromJson(Map<String?, dynamic>? json) {
    success = UserData.fromJson(json?['success']);
  }

  Map<String?, dynamic>? toJson() {
    final _data = <String?, dynamic>{};
    _data['success'] = success.toJson();
    return _data;
  }
}
