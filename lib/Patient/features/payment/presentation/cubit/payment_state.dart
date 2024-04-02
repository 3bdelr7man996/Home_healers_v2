part of 'payment_cubit.dart';

enum PayType { visa, tamara, apple, wallet, tap }

enum PayCard { master, visa, american, mada ,apple}

class PaymentState extends Equatable {
  const PaymentState({
    this.visaUrl,
    this.selectedPayType,
    this.selectedPayCard,
    this.payId,
    this.walletBalance,
    this.payState = RequestState.initial,
    this.payWalletState = RequestState.initial,
    this.balanceState = RequestState.initial,
  });

  final String? visaUrl;
  final String? payId;
  final RequestState payState;
  final PayType? selectedPayType;
  final PayCard? selectedPayCard;
  final RequestState payWalletState;
  final String? walletBalance;
  final RequestState balanceState;
  @override
  List<Object?> get props => [
        visaUrl,
        payId,
        payState,
        selectedPayCard,
        selectedPayType,
        payWalletState,
        walletBalance,
        balanceState,
      ];
  PaymentState copyWith({
    int? Function()? selectedPayIndexRadio,
    String? visaUrl,
    String? payId,
    RequestState? payState,
    RequestState? payWalletState,
    PayCard? Function()? selectedPayCard,
    PayType? Function()? selectedPayType,
    String? walletBalance,
    RequestState? balanceState,
  }) =>
      PaymentState(
        visaUrl: visaUrl ?? this.visaUrl,
        payId: payId ?? this.payId,
        payState: payState ?? this.payState,
        payWalletState: payWalletState ?? this.payWalletState,
        walletBalance: walletBalance ?? this.walletBalance,
        balanceState: balanceState ?? this.balanceState,
        selectedPayCard:
            selectedPayCard != null ? selectedPayCard() : this.selectedPayCard,
        selectedPayType:
            selectedPayType != null ? selectedPayType() : this.selectedPayType,
      );
}
