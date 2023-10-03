part of 'auth_cubit.dart';

class AuthStateForPatient extends Equatable {
  const AuthStateForPatient({
    this.email,
    this.firstName,
    this.requestStatus = false,
    this.lastName,
    this.phone,
    this.term = false,
    this.gender,
    this.obscurePass = true,
    this.obscureConfPass = true,
    this.city_id,
    this.registerState = RequestState.initial,
    this.password,
    this.confirmPassword,
    this.isVisible = false,
  });
  final String? email;
  final bool obscurePass;
  final bool requestStatus;
  final RequestState registerState;
  final bool isVisible;
  final bool obscureConfPass;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? gender;
  final String? city_id;
  final String? password;
  final bool term;
  final String? confirmPassword;

  @override
  List<Object?> get props => [
        email,
        firstName,
        registerState,
        lastName,
        requestStatus,
        phone,
        gender,
        isVisible,
        city_id,
        password,
        term,
        obscurePass,
        obscureConfPass,
        confirmPassword,
      ];
  AuthStateForPatient copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? gender,
    String? city_id,
    bool? obscurePass,
    bool? obscureConfPass,
    bool? isVisible,
    bool? requestStatus,
    RequestState? registerState,
    bool? term,
    String? password,
    String? confirmPassword,
  }) =>
      AuthStateForPatient(
          email: email ?? this.email,
          isVisible: isVisible ?? this.isVisible,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          gender: gender ?? this.gender,
          city_id: city_id ?? this.city_id,
          phone: phone ?? this.phone,
          registerState: registerState ?? this.registerState,
          password: password ?? this.password,
          obscurePass: obscurePass ?? this.obscurePass,
          obscureConfPass: obscureConfPass ?? this.obscureConfPass,
          confirmPassword: confirmPassword ?? this.confirmPassword,
          term: term ?? this.term,
          requestStatus: requestStatus ?? this.requestStatus);
}
