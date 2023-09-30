import 'package:dr/Patient/features/home/data/models/reservation-model.dart';
import 'package:dr/Patient/features/setting/data/datasources/update_reservation_ds.dart';
import 'package:dr/Patient/features/setting/data/models/update_reservation_model.dart';

class UpdateReservationRepo {
  final UpdateReservationDS dataSource;

  UpdateReservationRepo({required this.dataSource});

  Future<UpdateReservationModel> updateReservation({
    required Map<String, dynamic> body,
  }) async {
    print("bodyyyy== $body");
    UpdateReservationModel updateReservationResponse =
        UpdateReservationModel.fromJson(
      await dataSource.updateReservation(
        body: body,
      ),
    );
    return updateReservationResponse;
  }
}
