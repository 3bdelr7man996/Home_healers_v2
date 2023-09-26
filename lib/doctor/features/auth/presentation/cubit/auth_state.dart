part of 'auth_cubit.dart';

class AuthState extends Equatable {
  AuthState({
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.description,
    this.identification,
    this.iban,
    this.location,
    this.gender,
    this.password,
    this.confPassword,
    this.selectedCategories,
    this.selectedStatus,
    this.selectedCity,
    this.profileImg,
    this.advertiseDocuments,
    this.address,
    this.departemensList,
    this.statusList,
    this.areasList,
    this.citiesList,
    this.obscurePass = true,
    this.obscureConfPass = true,
    this.term = false,
    this.statusState = RequestState.initial,
    this.departementState = RequestState.initial,
    this.citiesState = RequestState.initial,
    this.registerState = RequestState.initial,
  });
  final String? email;
  final String? firstName;
  final String? lastName;
  var areasList;
  final String? phone;
  final String? description;
  final String? iban;
  final String? identification;
  final String? address;
  final String? gender;
  final String? password;
  final String? confPassword;
  final List<int>? selectedCategories;
  final List<int>? selectedStatus;
  final int? selectedCity;
  final File? profileImg;
  final List<File>? advertiseDocuments;
  final Location? location;
  final List<Categories>? departemensList;
  final List<StatusData>? statusList;
  final List<CityData>? citiesList;
  final bool obscurePass;
  final bool obscureConfPass;
  final bool term;
  final RequestState registerState;
  final RequestState departementState;
  final RequestState statusState;
  final RequestState citiesState;

  @override
  List<Object?> get props => [
        email,
        firstName,
        lastName,
        phone,
        identification,
        description,
        areasList,
        iban,
        location,
        gender,
        password,
        confPassword,
        selectedCategories,
        selectedStatus,
        selectedCity,
        profileImg,
        advertiseDocuments,
        address,
        departemensList,
        statusList,
        citiesList,
        obscurePass,
        obscureConfPass,
        term,
        registerState,
        departementState,
        statusState,
        citiesState,
      ];
  AuthState copyWith({
    String? email,
    String? firstName,
    areasList,
    String? lastName,
    String? phone,
    String? identification,
    String? description,
    String? iban,
    String? address,
    String? gender,
    String? password,
    String? confPassword,
    List<int>? selectedCategories,
    List<int>? selectedStatus,
    int? selectedCity,
    File? profileImg,
    List<File>? advertiseDocuments,
    Location? location,
    RequestState? registerState,
    List<Categories>? departemensList,
    List<StatusData>? statusList,
    List<CityData>? citiesList,
    bool? obscurePass,
    bool? obscureConfPass,
    bool? term,
    RequestState? departementState,
    RequestState? statusState,
    RequestState? citiesState,
  }) =>
      AuthState(
        email: email ?? this.email,
        advertiseDocuments: advertiseDocuments ?? this.advertiseDocuments,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        areasList: areasList ?? this.areasList,
        gender: gender ?? this.gender,
        iban: iban ?? this.iban,
        identification: identification ?? this.identification,
        phone: phone ?? this.phone,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        profileImg: profileImg ?? this.profileImg,
        location: location ?? this.location,
        password: password ?? this.confPassword,
        description: description ?? this.description,
        confPassword: confPassword ?? this.confPassword,
        selectedStatus: selectedStatus ?? this.selectedStatus,
        selectedCity: selectedCity ?? this.selectedCity,
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
      );
}
