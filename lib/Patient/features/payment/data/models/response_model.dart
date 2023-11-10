class ResponseModel {
  String? success;
  String? message;
  String? status;
  bool? paySuccess;

  ResponseModel({this.success, this.message, this.status, this.paySuccess});

  ResponseModel.fromJson(Map<String, dynamic>? json) {
    success = json?['Success'] ?? '';
    message = json?['message'] ?? '';
    status = json?['status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
