part of 'setting_cubit.dart';

class SettingState extends Equatable {
  const SettingState({
    this.docFile,
    this.pushStatus = RequestState.initial,
    this.myDocuments,
    this.pullStatus = RequestState.initial,
    this.appInfo,
    this.pointsData,
    this.pointState = RequestState.initial,
  });

  final List<File>? docFile;
  final RequestState pushStatus;
  final List<String>? myDocuments;
  final RequestState pullStatus;
  final InfoData? appInfo;
  final DoctorPointsModel? pointsData;
  final RequestState pointState;

  @override
  List<Object?> get props => [
        docFile,
        pushStatus,
        myDocuments,
        pullStatus,
        appInfo,
        pointsData,
        pointState,
      ];
  SettingState copyWith({
    List<File>? docFile,
    RequestState? pushStatus,
    List<String>? myDocuments,
    RequestState? pullStatus,
    InfoData? appInfo,
    DoctorPointsModel? pointsData,
    RequestState? pointState,
  }) =>
      SettingState(
        docFile: docFile ?? this.docFile,
        myDocuments: myDocuments ?? this.myDocuments,
        pullStatus: pullStatus ?? this.pullStatus,
        pushStatus: pushStatus ?? this.pushStatus,
        appInfo: appInfo ?? this.appInfo,
        pointsData: pointsData ?? this.pointsData,
        pointState: pointState ?? this.pointState,
      );
}
