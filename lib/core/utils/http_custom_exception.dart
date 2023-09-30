class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([ResponseFailure? message])
      : super(message?.data?.descAr?.first ?? "",
            "Invalid Request: ${message?.message} ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([ResponseFailure? message])
      : super(message?.data?.descAr?.first ?? "",
            "Unauthorised  ${message?.message}");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ResponseFailure {
  bool? success;
  String? message;
  ErrorData? data;

  ResponseFailure({this.success, this.message, this.data});

  ResponseFailure.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ErrorData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ErrorData {
  List<String>? descAr;

  ErrorData({this.descAr});

  ErrorData.fromJson(Map<String, dynamic> json) {
    descAr = json['desc_ar'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['desc_ar'] = descAr;
    return data;
  }
}
