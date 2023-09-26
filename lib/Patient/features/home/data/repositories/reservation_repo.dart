import 'package:dr/Patient/features/home/data/datasources/reservation_ds.dart';
import 'package:dr/Patient/features/home/data/models/reservation-model.dart';

class ReservationRepo {
  final reservationDs dataSource;

  ReservationRepo({required this.dataSource});

  Future<reservationModel> MakeReservation({
    required Map<String, dynamic> body,
  }) async {
    print("bodyyyy== $body");
    reservationModel MakeReservationResponse = reservationModel.fromJson(
      await dataSource.MakeReservation(
        body: body,
      ),
    );
    return MakeReservationResponse;
  }
}
