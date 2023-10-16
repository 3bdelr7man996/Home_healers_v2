part of 'payment_cubit.dart';

enum PayType { visa, tamara, apple, wallet }

class PaymentState extends Equatable {
  const PaymentState({
    this.visaUrl,
    this.selectedPayType,
    this.payId,
    this.payState = RequestState.initial,
  });

  final String? visaUrl;
  final String? payId;
  final RequestState payState;
  final PayType? selectedPayType;
  @override
  List<Object?> get props => [
        visaUrl,
        payId,
        payState,
        selectedPayType,
      ];
  PaymentState copyWith({
    String? visaUrl,
    String? payId,
    RequestState? payState,
    PayType? Function()? selectedPayType,
  }) =>
      PaymentState(
        visaUrl: visaUrl ?? this.visaUrl,
        payId: payId ?? this.payId,
        payState: payState ?? this.payState,
        selectedPayType:
            selectedPayType != null ? selectedPayType() : this.selectedPayType,
      );
}
