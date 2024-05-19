class Workinghours {
  int? id;
  int? advertiserId;
  String? sundayStartAt;
  String? sundayEndIn;
  String? mondayStartAt;
  String? mondayEndIn;
  String? tuesdayStartAt;
  String? tuesdayEndIn;
  String? wednesdayStartAt;
  String? wednesdayEndIn;
  String? thursdayStartAt;
  String? thursdayEndIn;
  String? fridayStartAt;
  String? fridayEndIn;
  String? saturdayStartAt;
  String? saturdayEndIn;
  String? createdAt;
  String? updatedAt;

  Workinghours(
      {this.id,
      this.advertiserId,
      this.sundayStartAt,
      this.sundayEndIn,
      this.mondayStartAt,
      this.mondayEndIn,
      this.tuesdayStartAt,
      this.tuesdayEndIn,
      this.wednesdayStartAt,
      this.wednesdayEndIn,
      this.thursdayStartAt,
      this.thursdayEndIn,
      this.fridayStartAt,
      this.fridayEndIn,
      this.saturdayStartAt,
      this.saturdayEndIn,
      this.createdAt,
      this.updatedAt});

  Workinghours.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    advertiserId = json?['advertiser_id'];
    sundayStartAt = json?['sunday_start_at'];
    sundayEndIn = json?['sunday_end_in'];
    mondayStartAt = json?['monday_start_at'];
    mondayEndIn = json?['monday_end_in'];
    tuesdayStartAt = json?['tuesday_start_at'];
    tuesdayEndIn = json?['tuesday_end_in'];
    wednesdayStartAt = json?['wednesday_start_at'];
    wednesdayEndIn = json?['wednesday_end_in'];
    thursdayStartAt = json?['thursday_start_at'];
    thursdayEndIn = json?['thursday_end_in'];
    fridayStartAt = json?['friday_start_at'];
    fridayEndIn = json?['friday_end_in'];
    saturdayStartAt = json?['saturday_start_at'];
    saturdayEndIn = json?['saturday_end_in'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['advertiser_id'] = this.advertiserId;
    data['sunday_start_at'] = this.sundayStartAt;
    data['sunday_end_in'] = this.sundayEndIn;
    data['monday_start_at'] = this.mondayStartAt;
    data['monday_end_in'] = this.mondayEndIn;
    data['tuesday_start_at'] = this.tuesdayStartAt;
    data['tuesday_end_in'] = this.tuesdayEndIn;
    data['wednesday_start_at'] = this.wednesdayStartAt;
    data['wednesday_end_in'] = this.wednesdayEndIn;
    data['thursday_start_at'] = this.thursdayStartAt;
    data['thursday_end_in'] = this.thursdayEndIn;
    data['friday_start_at'] = this.fridayStartAt;
    data['friday_end_in'] = this.fridayEndIn;
    data['saturday_start_at'] = this.saturdayStartAt;
    data['saturday_end_in'] = this.saturdayEndIn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
