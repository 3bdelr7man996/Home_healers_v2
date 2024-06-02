part of 'filter_cubit.dart';

class FilterState extends Equatable {
  FilterState({
    this.Loading = false,
    this.category_id,
    this.status_id,
    this.gender,
    this.city_id,
    this.specialistList,
    this.area_id,
    this.areaList,
    this.showArea = false,
    this.showCateg = false,
    this.showCity = false,
    this.showGender = false,
    this.showStatus = false,
  });
  final bool Loading;
  final Item? category_id;
  final Item? status_id;
  final Item? city_id;
  final Item? area_id;
  final Item? gender;
  final List<Area>? areaList;
  final bool showCateg;
  final bool showStatus;
  final bool showCity;
  final bool showArea;
  final bool showGender;

  final Map<String, dynamic>? specialistList;
  @override
  @override
  List<Object?> get props => [
        Loading,
        status_id,
        city_id,
        gender,
        area_id,
        category_id,
        specialistList,
        areaList,
        showCateg,
        showStatus,
        showCity,
        showArea,
        showGender,
      ];
  FilterState copyWith({
    bool? Loading,
    Item? Function()? category_id,
    Item? Function()? area_id,
    Item? Function()? gender,
    Item? Function()? status_id,
    Item? Function()? city_id,
    Map<String, dynamic>? specialistList,
    List<Area>? areaList,
    bool? showCateg,
    bool? showStatus,
    bool? showCity,
    bool? showArea,
    bool? showGender,
  }) =>
      FilterState(
        Loading: Loading ?? this.Loading,
        city_id: city_id != null ? city_id() : this.city_id,
        gender: gender != null ? gender() : this.gender,
        area_id: area_id != null ? area_id() : this.area_id,
        category_id: category_id != null ? category_id() : this.category_id,
        status_id: status_id != null ? status_id() : this.status_id,
        specialistList: specialistList ?? this.specialistList,
        areaList: areaList ?? this.areaList,
        showArea: showArea ?? this.showArea,
        showCateg: showCateg ?? this.showCateg,
        showCity: showCity ?? this.showCity,
        showGender: showGender ?? this.showGender,
        showStatus: showStatus ?? this.showStatus,
      );
}

abstract class RadioItem {
  final int? id;
  final String nameAr;

  RadioItem({this.id, this.nameAr = ''});
}

class Item extends RadioItem {
  final int? id;
  final String nameAr;
  Item({this.id, this.nameAr = ''}) : super(id: id, nameAr: nameAr);
}
