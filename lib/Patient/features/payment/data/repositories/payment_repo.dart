import 'package:dr/Patient/features/payment/data/datasources/payment_ds.dart';
import 'package:dr/Patient/features/payment/data/models/visa_pay_model.dart';

class PaymentRepository {
  final PaymentDataSource dataSource;

  PaymentRepository({required this.dataSource});

  Future<VisaPayModel>? visaPayment(
    Map<String, dynamic> body,
  ) async {
    Map<String, dynamic>? response = await dataSource.visaPayment(body: body);
    return VisaPayModel.fromJson(response);
  }

  // Future<VisaPayModel>? tamaraPayment(
  //   Map<String, dynamic> body,
  // ) async {
  //   Map<String, dynamic>? response = await dataSource.tamaraPayment(body: body);
  //   return response;
  // }

  Future<String>? visaPayResult({
    required String fullUrl,
  }) async {
    Map<String, dynamic>? response =
        await dataSource.visaPayResult(url: fullUrl);
    return response?['status'];
  }
}
