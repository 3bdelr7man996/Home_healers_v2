part of 'setting_cubit.dart';

class SettingState extends Equatable {
  const SettingState(
      {this.changePasswordData,
      this.docFile,
      this.pushStatus = RequestState.initial,
      this.myDocuments,
      this.pullStatus = RequestState.initial,
      this.appInfo,
      this.pointsData,
      this.pointState = RequestState.initial,
      this.showOldPassword = false,
      this.showNewPassword = false,
      this.showConfirmPassword = false,
      this.oldPasswordValue,
      this.newPasswordValue,
      this.confirmPasswordValue});

  final List<File>? docFile;
  final RequestState pushStatus;
  final List<String>? myDocuments;
  final RequestState pullStatus;
  final InfoData? appInfo;
  final DoctorPointsModel? pointsData;
  final RequestState pointState;
  final ChangePasswordModel? changePasswordData;
  final bool showOldPassword;
  final bool showNewPassword;
  final bool showConfirmPassword;
  final String? oldPasswordValue;
  final String? newPasswordValue;
  final String? confirmPasswordValue;

  @override
  List<Object?> get props => [
        docFile,
        pushStatus,
        myDocuments,
        pullStatus,
        appInfo,
        changePasswordData,
        pointsData,
        pointState,
        showOldPassword,
        showNewPassword,
        showConfirmPassword,
        oldPasswordValue,
        newPasswordValue,
        confirmPasswordValue
      ];
  SettingState copyWith({
    List<File>? docFile,
    RequestState? pushStatus,
    List<String>? myDocuments,
    RequestState? pullStatus,
    InfoData? appInfo,
    DoctorPointsModel? pointsData,
    RequestState? pointState,
    ChangePasswordModel? changePasswordData,
    bool? showOldPassword,
    bool? showNewPassword,
    bool? showConfirmPassword,
    String? oldPasswordValue,
    String? newPasswordValue,
    String? confirmPasswordValue,
  }) =>
      SettingState(
        docFile: docFile ?? this.docFile,
        myDocuments: myDocuments ?? this.myDocuments,
        pullStatus: pullStatus ?? this.pullStatus,
        pushStatus: pushStatus ?? this.pushStatus,
        appInfo: appInfo ?? this.appInfo,
        pointsData: pointsData ?? this.pointsData,
        pointState: pointState ?? this.pointState,
        changePasswordData: changePasswordData ?? this.changePasswordData,
        showOldPassword: showOldPassword ?? this.showOldPassword,
        showNewPassword: showNewPassword ?? this.showNewPassword,
        showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
        oldPasswordValue: oldPasswordValue ?? this.oldPasswordValue,
        newPasswordValue: newPasswordValue ?? this.newPasswordValue,
        confirmPasswordValue: confirmPasswordValue ?? this.confirmPasswordValue,
      );
}
