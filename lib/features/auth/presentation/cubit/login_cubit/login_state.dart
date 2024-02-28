part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email,
    this.password,
    this.obscurePass = true,
    this.loginState = RequestState.initial,
  });
  final RequestState loginState;
  final String? email;
  final String? password;
  final bool obscurePass;

  @override
  List<Object?> get props => [
        loginState,
        email,
        password,
        obscurePass,
      ];

  LoginState copyWith({
    RequestState? loginState,
    String? email,
    String? password,
    bool? obscurePass,
  }) =>
      LoginState(
        loginState: loginState ?? this.loginState,
        email: email ?? this.email,
        password: password ?? this.password,
        obscurePass: obscurePass ?? this.obscurePass,
      );
}
