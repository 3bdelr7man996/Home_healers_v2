class Categories {
  Categories({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    required this.orderNum,
    required this.image,
    required this.pivot,
  });
  late final int id;
  late final String? nameAr;
  late final String? nameEn;
  late final String? status;
  late final int? orderNum;
  late final String? image;
  late final Pivot? pivot;

  Categories.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
    orderNum = json?['order_num'];
    image = json?['image'];
    pivot = Pivot.fromJson(json?['pivot']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['status'] = status;
    data['order_num'] = orderNum;
    data['image'] = image;
    data['pivot'] = pivot?.toJson();
    return data;
  }
}

class Pivot {
  Pivot({
    required this.advertiserId,
    required this.categoryId,
  });
  late final int? advertiserId;
  late final int? categoryId;

  Pivot.fromJson(Map<String, dynamic>? json) {
    advertiserId = json?['advertiser_id'];
    categoryId = json?['category_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['advertiser_id'] = advertiserId;
    data['category_id'] = categoryId;
    return data;
  }
}
