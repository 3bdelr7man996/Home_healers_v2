part of 'auth_cubit.dart';

// ignore: must_be_immutable
class AuthStateForPatient extends Equatable {
  AuthStateForPatient(
      {this.email,
      this.firstName,
      this.requestStatus = false,
      this.lastName,
      this.phone,
      this.country_code = "SA",
      this.term = false,
      this.gender,
      this.cityId,
      this.obscurePass = true,
      this.obscureConfPass = true,
      this.city_id,
      this.registerState = RequestState.initial,
      this.password,
      this.confirmPassword,
      this.isVisible = false,
      this.address,
      this.nationality,
      this.advertiser,
      this.age,
      this.birthday,
      this.location});
  final String? email;
  final String? age;
  var birthday;
  final bool obscurePass;
  final bool requestStatus;
  final RequestState registerState;
  final bool isVisible;
  final bool obscureConfPass;
  final String? firstName;
  final String? lastName;
  var cityId;
  var country_code;
  final String? phone;
  final String? gender;
  final String? city_id;
  final String? password;
  final bool term;
  final String? confirmPassword;
  var address;
  var advertiser;
  var location;
  var nationality;
  @override
  List<Object?> get props => [
        email,
        address,
        advertiser,
        firstName,
        age,
        birthday,
        country_code,
        registerState,
        lastName,
        requestStatus,
        cityId,
        nationality,
        phone,
        gender,
        isVisible,
        city_id,
        password,
        term,
        obscurePass,
        obscureConfPass,
        confirmPassword,
        location,
      ];
  AuthStateForPatient copyWith(
          {String? email,
          String? firstName,
          String? lastName,
          String? phone,
          String? gender,
          String? age,
          String? birthday,
          String? city_id,
          bool? obscurePass,
          bool? obscureConfPass,
          bool? isVisible,
          bool? requestStatus,
          RequestState? registerState,
          bool? term,
          String? password,
          String? confirmPassword,
          var address,
          var advertiser,
          var cityId,
          var country_code,
          var nationality,
          var location}) =>
      AuthStateForPatient(
          email: email ?? this.email,
          isVisible: isVisible ?? this.isVisible,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          gender: gender ?? this.gender,
          age: age ?? this.age,
          birthday: birthday ?? this.birthday,
          city_id: city_id ?? this.city_id,
          phone: phone ?? this.phone,
          registerState: registerState ?? this.registerState,
          password: password ?? this.password,
          obscurePass: obscurePass ?? this.obscurePass,
          obscureConfPass: obscureConfPass ?? this.obscureConfPass,
          confirmPassword: confirmPassword ?? this.confirmPassword,
          term: term ?? this.term,
          address: address ?? this.address,
          advertiser: advertiser ?? this.advertiser,
          location: location ?? this.location,
          cityId: cityId ?? this.cityId,
          nationality: nationality ?? this.nationality,
          country_code: country_code ?? this.country_code,
          requestStatus: requestStatus ?? this.requestStatus);
}
