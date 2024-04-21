// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UpdateInfoState extends Equatable {
  UpdateInfoState(
      {this.Loading = false,
      this.fullName,
      this.email,
      this.mobile,
      this.gender,
      this.cityId,
      this.image,
      this.citySelected});
  final bool Loading;
  final String? fullName;
  final String? email;
  final String? mobile;
  final String? gender;
  final String? cityId;
  var image;
  var citySelected;

  @override
  @override
  List<Object?> get props =>
      [Loading, fullName, email, mobile, gender, cityId, image, citySelected];
  UpdateInfoState copyWith({
    bool? Loading,
    String? fullName,
    String? email,
    String? mobile,
    String? gender,
    String? cityId,
    var image,
    var citySelected,
  }) =>
      UpdateInfoState(
          Loading: Loading ?? this.Loading,
          email: email ?? this.email,
          mobile: mobile ?? this.mobile,
          gender: gender ?? this.gender,
          image: image ?? this.image,
          cityId: cityId ?? this.cityId,
          citySelected: citySelected ?? this.citySelected,
          fullName: fullName ?? this.fullName);
}
