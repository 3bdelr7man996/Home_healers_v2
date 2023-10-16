import 'package:dr/Patient/features/home/data/datasources/reservation_with_offer_ds.dart';
import 'package:dr/Patient/features/home/data/models/reservation_with_offer_model.dart';

class ReservationWithOfferRepo {
  final ReservationWithOfferDS dataSource;

  ReservationWithOfferRepo({required this.dataSource});

  Future<ReservationWithOfferModel> MakeReservation({
    required Map<String, dynamic> body,
  }) async {
    print("bodyyyy== $body");
    ReservationWithOfferModel MakeReservationResponse =
        ReservationWithOfferModel.fromJson(
      await dataSource.MakeReservationWithOffer(
        body: body,
      ),
    );
    return MakeReservationResponse;
  }
}
