part of 'edit_user_acc_cubit.dart';

class EditUserAccState extends Equatable {
  const EditUserAccState({
    this.userInfo,
    this.fullName,
    this.email,
    this.mobile,
    this.gender,
    this.city,
    this.avatar,
    this.img,
    this.citiesList,
    this.updateState = RequestState.initial,
    this.citiesState = RequestState.initial,
  });
  final UserData? userInfo;
  final String? fullName;
  final String? email;
  final String? mobile;
  final String? gender;
  final CityData? city;
  final String? avatar;
  final File? img;
  final List<CityData>? citiesList;
  final RequestState citiesState;
  final RequestState updateState;

  @override
  List<Object?> get props => [
        userInfo,
        fullName,
        email,
        mobile,
        gender,
        city,
        avatar,
        img,
        citiesList,
        citiesState,
        updateState,
      ];
  EditUserAccState copyWith({
    UserData? userInfo,
    String? fullName,
    String? email,
    String? mobile,
    String? gender,
    CityData? city,
    File? img,
    String? avatar,
    List<CityData>? citiesList,
    RequestState? citiesState,
    RequestState? updateState,
  }) =>
      EditUserAccState(
        userInfo: userInfo ?? this.userInfo,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        mobile: mobile ?? this.mobile,
        gender: gender ?? this.gender,
        city: city ?? this.city,
        img: img ?? this.img,
        citiesList: citiesList ?? this.citiesList,
        citiesState: citiesState ?? this.citiesState,
        updateState: updateState ?? this.updateState,
      );
}
