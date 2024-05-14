part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email,
    this.password,
    this.obscurePass = true,
    this.loginState = RequestState.initial,
    this.deleteState = RequestState.initial,
  });
  final RequestState loginState;
  final RequestState deleteState;
  final String? email;
  final String? password;
  final bool obscurePass;

  @override
  List<Object?> get props => [
        loginState,
        deleteState,
        email,
        password,
        obscurePass,
      ];

  LoginState copyWith({
    RequestState? loginState,
    RequestState? deleteState,
    String? email,
    String? password,
    bool? obscurePass,
  }) =>
      LoginState(
        loginState: loginState ?? this.loginState,
        deleteState: deleteState ?? this.deleteState,
        email: email ?? this.email,
        password: password ?? this.password,
        obscurePass: obscurePass ?? this.obscurePass,
      );
}
