class DocumentsModel {
  DocumentSuccess? success;

  DocumentsModel({this.success});

  DocumentsModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'] != null
        ? DocumentSuccess.fromJson(json?['success'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.toJson();
    }
    return data;
  }
}

class DocumentSuccess {
  int? id;
  String? name;
  String? email;
  String? mobile;
  List<String>? images;

  DocumentSuccess({this.id, this.name, this.email, this.mobile, this.images});

  DocumentSuccess.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    email = json?['email'];
    mobile = json?['mobile'];
    images = json?['images']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['images'] = images;
    return data;
  }
}
