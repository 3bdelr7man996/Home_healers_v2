// ignore_for_file: must_be_immutable

import 'package:dr/Patient/features/home/data/models/section-model.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  SearchState({
    this.Loading = false,
    this.listOfResponse,
  });
  final bool Loading;

  SectionModel? listOfResponse;
  @override
  @override
  List<Object?> get props => [Loading, listOfResponse];
  SearchState copyWith({
    bool? Loading,
    SectionModel? listOfResponse,
  }) =>
      SearchState(
        Loading: Loading ?? this.Loading,
        listOfResponse: listOfResponse ?? this.listOfResponse,
      );
}
