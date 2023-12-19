import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';

class MyOrdersModel {
  MyOrdersModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<OrderData>? data;
  late final String message;

  MyOrdersModel.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    data = List.from(json?['data']).map((e) => OrderData.fromJson(e)).toList();
    message = json?['message'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class OrderData {
  OrderData({
    required this.id,
    required this.parentId,
    required this.userId,
    required this.advertiserId,
    this.notes,
    this.coupon,
    this.days,
    this.startAt,
    this.endAt,
    required this.sessionsCount,
    required this.subTotal,
    required this.vat,
    required this.fees,
    required this.amount,
    required this.isPaid,
    this.paymentDetails,
    required this.status,
    this.lat,
    this.lang,
    this.centerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.statusId,
    required this.canReview,
    this.qrCode,
    required this.reports,
    this.diagnoseForm,
    required this.advertiser,
  });
  late var id;
  late var parentId;
  late var userId;
  late var advertiserId;
  late var notes;
  late var coupon;
  late var days;
  late var startAt;
  late var endAt;
  late var sessionsCount;
  late var subTotal;
  late var vat;
  late var fees;
  late var amount;
  late var isPaid;
  late var paymentDetails;
  late var status;
  late var lat;
  late var lang;
  late var centerId;
  late var createdAt;
  late var updatedAt;
  late var deletedAt;
  late var statusId;
  late var canReview;
  late var qrCode;
  late var reports;
  late var diagnoseForm;
  late final Advertiser advertiser;

  OrderData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    parentId = json?['parent_id'];
    userId = json?['user_id'];
    advertiserId = json?['advertiser_id'];
    notes = json?['notes'];
    coupon = json?['coupon'];
    days = json?['days'];
    startAt = json?['start_at'];
    endAt = json?['end_at'];
    sessionsCount = json?['sessions_count'];
    subTotal = json?['sub_total'];
    vat = json?['vat'];
    fees = json?['fees'];
    amount = json?['amount'];
    isPaid = json?['is_paid'];
    paymentDetails = json?['payment_details'];
    status = json?['status'];
    lat = json?['lat'];
    lang = json?['lang'];
    centerId = json?['center_id'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    deletedAt = json?['delet_at'];
    statusId = json?['status_id'];
    canReview = json?['can_review'];
    qrCode = json?['qr_code'];
    reports = List.castFrom<dynamic, dynamic>(json?['reports'] ?? []);
    diagnoseForm = json?['diagnose_form'];
    advertiser = Advertiser.fromJson(json?['advertiser']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['user_id'] = userId;
    _data['advertiser_id'] = advertiserId;
    _data['notes'] = notes;
    _data['coupon'] = coupon;
    _data['days'] = days;
    _data['start_at'] = startAt;
    _data['end_at'] = endAt;
    _data['sessions_count'] = sessionsCount;
    _data['sub_total'] = subTotal;
    _data['vat'] = vat;
    _data['fees'] = fees;
    _data['amount'] = amount;
    _data['is_paid'] = isPaid;
    _data['payment_details'] = paymentDetails;
    _data['status'] = status;
    _data['lat'] = lat;
    _data['lang'] = lang;
    _data['center_id'] = centerId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['status_id'] = statusId;
    _data['can_review'] = canReview;
    _data['qr_code'] = qrCode;
    _data['reports'] = reports;
    _data['diagnose_form'] = diagnoseForm;
    _data['advertiser'] = advertiser.toJson();
    return _data;
  }
}

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
  late var id;
  late var nameAr;
  late var nameEn;
  late var status;
  late var orderNum;
  late var image;
  late final Pivot pivot;

  Categories.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
    orderNum = json?['order_num'];
    image = json?['image'];
    pivot = Pivot.fromJson(json?['pivot']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['status'] = status;
    _data['order_num'] = orderNum;
    _data['image'] = image;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.advertiserId,
    required this.categoryId,
  });
  late var advertiserId;
  late var categoryId;

  Pivot.fromJson(Map<String, dynamic>? json) {
    advertiserId = json?['advertiser_id'];
    categoryId = json?['category_id'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['advertiser_id'] = advertiserId;
    _data['category_id'] = categoryId;
    return _data;
  }
}

class StatusAdvisor {
  StatusAdvisor({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.status,
    required this.pivot,
  });
  late var id;
  late var nameAr;
  late var nameEn;
  late var status;
  late final Pivot pivot;

  StatusAdvisor.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    status = json?['status'];
    pivot = Pivot.fromJson(json?['pivot']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['status'] = status;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}
