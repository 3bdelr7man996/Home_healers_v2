import 'package:equatable/equatable.dart';

class SectionState extends Equatable {
  SectionState({
    this.Loading = false,
    this.sectionNumber,
    this.listOfResponse,
  });
  final bool Loading;
  final int? sectionNumber;
  Map<String, dynamic>? listOfResponse;
  @override
  @override
  List<Object?> get props => [Loading, sectionNumber, listOfResponse];
  SectionState copyWith({
    bool? Loading,
    int? sectionNumber,
    Map<String, dynamic>? listOfResponse,
  }) =>
      SectionState(
        Loading: Loading ?? this.Loading,
        sectionNumber: sectionNumber ?? this.sectionNumber,
        listOfResponse: listOfResponse ?? this.listOfResponse,
      );
}
