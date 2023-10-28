part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.advertiser,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.imgProfile,
    this.identification,
    this.iban,
    this.location,
    this.gender,
    this.password,
    this.confPassword,
    this.selectedCategories,
    this.selectedStatus,
    this.selectedCity,
    this.advertiseDocuments,
    this.address,
    this.departemensList,
    this.statusList,
    this.areasList,
    this.citiesList,
    this.obscurePass = true,
    this.obscureConfPass = true,
    this.term = false,
    this.showPopup = false,
    this.statusState = RequestState.initial,
    this.departementState = RequestState.initial,
    this.citiesState = RequestState.initial,
    this.registerState = RequestState.initial,
  });
  final Advertiser? advertiser;
  final String? email;
  final String? firstName;
  final String? lastName;
  final dynamic areasList;
  final String? phone;
  final File? imgProfile;
  final String? iban;
  final String? identification;
  final String? address;
  final String? gender;
  final String? password;
  final String? confPassword;
  final List<int>? selectedCategories;
  final List<int>? selectedStatus;
  final int? selectedCity;
  final List<File>? advertiseDocuments;
  final Location? location;
  final List<Categories>? departemensList;
  final List<StatusData>? statusList;
  final List<CityData>? citiesList;
  final bool obscurePass;
  final bool obscureConfPass;
  final bool term;
  final bool showPopup;
  final RequestState registerState;
  final RequestState departementState;
  final RequestState statusState;
  final RequestState citiesState;

  @override
  List<Object?> get props => [
        advertiser,
        imgProfile,
        email,
        firstName,
        lastName,
        phone,
        identification,
        iban,
        location,
        gender,
        password,
        confPassword,
        selectedCategories,
        selectedStatus,
        selectedCity,
        advertiseDocuments,
        address,
        departemensList,
        statusList,
        citiesList,
        obscurePass,
        obscureConfPass,
        term,
        showPopup,
        registerState,
        departementState,
        statusState,
        citiesState,
        areasList,
      ];
  AuthState copyWith({
    Advertiser? advertiser,
    String? email,
    String? firstName,
    areasList,
    String? lastName,
    String? phone,
    String? identification,
    File? imgProfile,
    String? iban,
    String? address,
    String? gender,
    String? password,
    String? confPassword,
    List<int>? Function()? selectedCategories,
    List<int>? Function()? selectedStatus,
    int? Function()? selectedCity,
    File? profileImg,
    List<File>? advertiseDocuments,
    Location? Function()? location,
    RequestState? registerState,
    List<Categories>? departemensList,
    List<StatusData>? statusList,
    List<CityData>? citiesList,
    bool? obscurePass,
    bool? obscureConfPass,
    bool? term,
    bool? showPopup,
    RequestState? departementState,
    RequestState? statusState,
    RequestState? citiesState,
  }) =>
      AuthState(
        advertiser: advertiser ?? this.advertiser,
        email: email ?? this.email,
        advertiseDocuments: advertiseDocuments ?? this.advertiseDocuments,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        areasList: areasList ?? this.areasList,
        gender: gender ?? this.gender,
        iban: iban ?? this.iban,
        identification: identification ?? this.identification,
        phone: phone ?? this.phone,
        selectedCategories: selectedCategories != null
            ? selectedCategories()
            : this.selectedCategories,
        location: location != null ? location() : this.location,
        password: password ?? this.password,
        imgProfile: imgProfile ?? this.imgProfile,
        confPassword: confPassword ?? this.confPassword,
        selectedStatus:
            selectedStatus != null ? selectedStatus() : this.selectedStatus,
        selectedCity: selectedCity != null ? selectedCity() : this.selectedCity,
        address: address ?? this.address,
        registerState: registerState ?? this.registerState,
        citiesList: citiesList ?? this.citiesList,
        citiesState: citiesState ?? this.citiesState,
        departemensList: departemensList ?? this.departemensList,
        departementState: departementState ?? this.departementState,
        statusList: statusList ?? this.statusList,
        statusState: statusState ?? this.statusState,
        obscurePass: obscurePass ?? this.obscurePass,
        obscureConfPass: obscureConfPass ?? this.obscureConfPass,
        term: term ?? this.term,
        showPopup: showPopup ?? this.showPopup,
      );
}
