part of 'forget_password_cubit.dart';

// ignore: must_be_immutable
class ForgetPasswordState extends Equatable {
  ForgetPasswordState({
    this.email,
    this.loading = false,
    this.showPopUp = false,
    this.activeState = RequestState.initial,
    this.resendCodeState = RequestState.initial,
    this.code = '',
  });
  final String? email;
  var loading;
  var showPopUp;
  RequestState activeState;
  RequestState resendCodeState;
  String code;

  @override
  List<Object?> get props => [
        email,
        loading,
        showPopUp,
        activeState,
        resendCodeState,
        code,
      ];

  ForgetPasswordState copyWith({
    String? email,
    var loading,
    var showPopUp,
    String? code,
    RequestState? activeState,
    RequestState? resendCodeState,
  }) =>
      ForgetPasswordState(
        email: email ?? this.email,
        loading: loading ?? this.loading,
        showPopUp: showPopUp ?? this.showPopUp,
        code: code ?? this.code,
        activeState: activeState ?? this.activeState,
        resendCodeState: resendCodeState ?? this.resendCodeState,
      );
}
