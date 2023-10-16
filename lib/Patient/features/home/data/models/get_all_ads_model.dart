class GetAllAdsModel {
  bool? success;
  List<Data>? data;
  String? message;

  GetAllAdsModel({this.success, this.data, this.message});

  GetAllAdsModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    if (json?['data'] != null) {
      data = List.from(json?['data']);
    }
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['success'] = this.success;
    if (this.data != null) {
      data?['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data?['message'] = this.message;
    return data;
  }
}

class Data {
  String? title;
  String? image;
  var status;
  var id;

  Data({this.title, this.image, this.status, this.id});

  Data.fromJson(Map<String, dynamic>? json) {
    title = json?['title'];
    image = json?['image'];
    status = json?['status'];
    id = json?['id'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['title'] = this.title;
    data?['image'] = this.image;
    data?['status'] = this.status;
    data?['id'] = this.id;
    return data;
  }
}
