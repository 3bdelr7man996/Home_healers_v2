// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../data/models/reports_model.dart';

class ReportsState extends Equatable {
  ReportsState({this.reportsForPatient, this.reportsForDoctors});

  List<DoctorReports>? reportsForDoctors;
  List<Reports>? reportsForPatient;

  @override
  @override
  List<Object?> get props => [reportsForPatient, reportsForDoctors];
  ReportsState copyWith({var Data, reportsForPatient, reportsForDoctors}) =>
      ReportsState(
        reportsForPatient: reportsForPatient ?? this.reportsForPatient,
        reportsForDoctors: reportsForDoctors ?? this.reportsForDoctors,
      );
}
