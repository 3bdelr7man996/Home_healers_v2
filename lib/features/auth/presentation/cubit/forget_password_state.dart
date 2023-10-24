part of 'forget_password_cubit.dart';

// ignore: must_be_immutable
class ForgetPasswordState extends Equatable {
  ForgetPasswordState(
      {this.email, this.loading = false, this.showPopUp = false});
  final String? email;
  var loading;
  var showPopUp;

  @override
  List<Object?> get props => [email, loading, showPopUp];

  ForgetPasswordState copyWith({
    String? email,
    var loading,
    var showPopUp,
  }) =>
      ForgetPasswordState(
        email: email ?? this.email,
        loading: loading ?? this.loading,
        showPopUp: showPopUp ?? this.showPopUp,
      );
}
