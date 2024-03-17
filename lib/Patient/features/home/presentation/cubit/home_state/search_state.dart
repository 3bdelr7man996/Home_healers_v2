// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  SearchState({
    this.Loading = false,
    this.listOfResponse,
  });
  final bool Loading;

  Map<String, dynamic>? listOfResponse;
  @override
  @override
  List<Object?> get props => [Loading, listOfResponse];
  SearchState copyWith({
    bool? Loading,
    Map<String, dynamic>? listOfResponse,
  }) =>
      SearchState(
        Loading: Loading ?? this.Loading,
        listOfResponse: listOfResponse ?? this.listOfResponse,
      );
}
