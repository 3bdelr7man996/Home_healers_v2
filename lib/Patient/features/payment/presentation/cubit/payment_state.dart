part of 'payment_cubit.dart';

enum PayType { visa, tamara, apple, wallet, tap }

class PaymentState extends Equatable {
  const PaymentState({
    this.visaUrl,
    this.selectedPayType,
    this.payId,
    this.payState = RequestState.initial,
    this.payWalletState = RequestState.initial,
  });

  final String? visaUrl;
  final String? payId;
  final RequestState payState;
  final PayType? selectedPayType;
  final RequestState payWalletState;
  @override
  List<Object?> get props => [
        visaUrl,
        payId,
        payState,
        selectedPayType,
        payWalletState,
      ];
  PaymentState copyWith({
    int? Function()? selectedPayIndexRadio,
    String? visaUrl,
    String? payId,
    RequestState? payState,
    RequestState? payWalletState,
    PayType? Function()? selectedPayType,
  }) =>
      PaymentState(
        visaUrl: visaUrl ?? this.visaUrl,
        payId: payId ?? this.payId,
        payState: payState ?? this.payState,
        payWalletState: payWalletState ?? this.payWalletState,
        selectedPayType:
            selectedPayType != null ? selectedPayType() : this.selectedPayType,
      );
}
