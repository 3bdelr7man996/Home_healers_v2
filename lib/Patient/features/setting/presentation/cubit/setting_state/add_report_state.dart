// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AddReportState extends Equatable {
  AddReportState({
    this.Data = false,
  });
  var Data;
  @override
  @override
  List<Object?> get props => [
        Data,
      ];
  AddReportState copyWith({
    var Data,
  }) =>
      AddReportState(
        Data: Data ?? this.Data,
      );
}
