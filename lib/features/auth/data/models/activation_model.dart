class ActivationModel {
  bool? success;
  String? message;

  ActivationModel({this.success, this.message});

  ActivationModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    message = json?['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
