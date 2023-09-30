part of 'diagnose_form_cubit.dart';

class DiagnoseFormState extends Equatable {
  const DiagnoseFormState({
    this.listDiagnoseSection,
    this.reservation,
    this.diagnoseValues,
    this.treatments,
    this.diagnoseForm,
    this.status = RequestState.initial,
    this.uploadStatus = RequestState.initial,
    this.errors,
  });

  final RequestState? status;
  final Map<String, dynamic>? listDiagnoseSection;
  final ReservationData? reservation;
  final Map<String, String>? diagnoseValues;
  final List<String?>? treatments;
  final DiagnoseForm? diagnoseForm;
  final Map<String, dynamic>? errors;
  final RequestState uploadStatus;

  @override
  List<Object?> get props => [
        listDiagnoseSection,
        reservation,
        diagnoseValues,
        treatments,
        diagnoseForm,
        status,
        errors,
        uploadStatus,
      ];

  DiagnoseFormState copyWith({
    Map<String, dynamic>? listDiagnoseSection,
    ReservationData? reservation,
    Map<String, String>? diagnoseValues,
    List<String?>? treatments,
    DiagnoseForm? diagnoseForm,
    RequestState? status,
    Map<String, dynamic>? errors,
    RequestState? uploadStatus,
  }) {
    return DiagnoseFormState(
      listDiagnoseSection: listDiagnoseSection ?? this.listDiagnoseSection,
      treatments: treatments ?? this.treatments,
      diagnoseValues: diagnoseValues ?? this.diagnoseValues,
      diagnoseForm: diagnoseForm ?? this.diagnoseForm,
      reservation: reservation ?? this.reservation,
      status: status ?? this.status,
      errors: errors ?? this.errors,
      uploadStatus: uploadStatus ?? this.uploadStatus,
    );
  }
}
