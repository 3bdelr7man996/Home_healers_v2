// ignore_for_file: must_be_immutable

import 'package:dr/doctor/features/auth/data/model/advertiser_model.dart';
import 'package:equatable/equatable.dart';

class SectionState extends Equatable {
  SectionState({
    this.Loading = false,
    this.sectionNumber,
    this.sectionDoctorsList,
  });
  final bool Loading;
  final int? sectionNumber;
  List<Advertiser>? sectionDoctorsList;
  @override
  @override
  List<Object?> get props => [Loading, sectionNumber, sectionDoctorsList];
  SectionState copyWith({
    bool? Loading,
    int? sectionNumber,
    List<Advertiser>? sectionDoctorsList,
  }) =>
      SectionState(
        Loading: Loading ?? this.Loading,
        sectionNumber: sectionNumber ?? this.sectionNumber,
        sectionDoctorsList: sectionDoctorsList ?? this.sectionDoctorsList,
      );
}
