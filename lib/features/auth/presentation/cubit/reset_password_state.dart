part of 'reset_password_cubit.dart';

// ignore: must_be_immutable
class ResetPasswordState extends Equatable {
  ResetPasswordState({
    this.email,
    this.loading = false,
    this.firstTextFormFieldValue,
    this.secondTextFormFieldValue,
    this.thirdTextFormFieldValue,
    this.fourthTextFormFieldValue,
    this.fifthTextFormFieldValue,
    this.sixthTextFormFieldValue,
    this.newPassword,
    this.confirmPass,
    this.showNewPass = false,
    this.showConfirmPass = false,
  });
  final String? email;
  var loading;

  var firstTextFormFieldValue;
  var secondTextFormFieldValue;
  var thirdTextFormFieldValue;
  var fourthTextFormFieldValue;
  var fifthTextFormFieldValue;
  var sixthTextFormFieldValue;
  var newPassword;
  var confirmPass;
  var showNewPass;
  var showConfirmPass;

  @override
  List<Object?> get props => [
        email,
        loading,
        firstTextFormFieldValue,
        secondTextFormFieldValue,
        thirdTextFormFieldValue,
        fourthTextFormFieldValue,
        sixthTextFormFieldValue,
        newPassword,
        confirmPass,
        fifthTextFormFieldValue,
        showNewPass,
        showConfirmPass,
      ];

  ResetPasswordState copyWith({
    String? email,
    var loading,
    var firstTextFormFieldValue,
    var secondTextFormFieldValue,
    var thirdTextFormFieldValue,
    var fourthTextFormFieldValue,
    var fifthTextFormFieldValue,
    var sixthTextFormFieldValue,
    var newPassword,
    var confirmPass,
    var showNewPass,
    var showConfirmPass,
  }) =>
      ResetPasswordState(
        email: email ?? this.email,
        loading: loading ?? this.loading,
        firstTextFormFieldValue:
            firstTextFormFieldValue ?? this.firstTextFormFieldValue,
        secondTextFormFieldValue:
            secondTextFormFieldValue ?? this.secondTextFormFieldValue,
        thirdTextFormFieldValue:
            thirdTextFormFieldValue ?? this.thirdTextFormFieldValue,
        fourthTextFormFieldValue:
            fourthTextFormFieldValue ?? this.fourthTextFormFieldValue,
        fifthTextFormFieldValue:
            fifthTextFormFieldValue ?? this.fifthTextFormFieldValue,
        sixthTextFormFieldValue:
            sixthTextFormFieldValue ?? this.sixthTextFormFieldValue,
        newPassword: newPassword ?? this.newPassword,
        confirmPass: confirmPass ?? this.confirmPass,
        showNewPass: showNewPass ?? this.showNewPass,
        showConfirmPass: showConfirmPass ?? this.showConfirmPass,
      );
}
