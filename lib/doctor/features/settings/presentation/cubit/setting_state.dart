part of 'setting_cubit.dart';

class SettingState extends Equatable {
  const SettingState({
    this.docFile,
    this.pushStatus = RequestState.initial,
    this.myDocuments,
    this.pullStatus = RequestState.initial,
    this.appInfo,
  });

  final List<File>? docFile;
  final RequestState pushStatus;
  final List<String>? myDocuments;
  final RequestState pullStatus;
  final InfoData? appInfo;

  @override
  List<Object?> get props => [
        docFile,
        pushStatus,
        myDocuments,
        pullStatus,
        appInfo,
      ];
  SettingState copyWith({
    List<File>? docFile,
    RequestState? pushStatus,
    List<String>? myDocuments,
    RequestState? pullStatus,
    InfoData? appInfo,
  }) =>
      SettingState(
        docFile: docFile ?? this.docFile,
        myDocuments: myDocuments ?? this.myDocuments,
        pullStatus: pullStatus ?? this.pullStatus,
        pushStatus: pushStatus ?? this.pushStatus,
        appInfo: appInfo ?? this.appInfo,
      );
}
