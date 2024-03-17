// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:equatable/equatable.dart';

class SectionState extends Equatable {
  SectionState({
    this.Loading = false,
    this.sectionNumber,
    this.listOfResponse,
  });
  final bool Loading;
  final int? sectionNumber;
  SectionModel? listOfResponse;
  @override
  @override
  List<Object?> get props => [Loading, sectionNumber, listOfResponse];
  SectionState copyWith({
    bool? Loading,
    int? sectionNumber,
    SectionModel? listOfResponse,
  }) =>
      SectionState(
        Loading: Loading ?? this.Loading,
        sectionNumber: sectionNumber ?? this.sectionNumber,
        listOfResponse: listOfResponse ?? this.listOfResponse,
      );
}
