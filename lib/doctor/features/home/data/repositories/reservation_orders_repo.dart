import 'package:dr/doctor/features/home/data/datasources/reservations_orders_ds.dart';
import 'package:dr/doctor/features/home/data/models/reservation_details_model.dart';
import 'package:dr/doctor/features/home/data/models/reservations_model.dart';
import 'package:dr/doctor/features/home/data/models/resevations_status_model.dart';

class ReservationOrdersRepo {
  final ReservationOrdersDS dataSource;

  ReservationOrdersRepo({required this.dataSource});

  Future<List<ReservationStatus>>? getResOrdersStatus() async {
    Map<String, dynamic>? response = await dataSource.getResOrdersStatus();
    List<ReservationStatus> reservList = [];
    if (response?['success'] == true) {
      for (int i = 0; i < response?['data'].length; i++) {
        if (response?['data'][i]["status"] != null) {
          reservList.add(
            ReservationStatus.fromJson(response?['data'][i]),
          );
        }
      }
    }
    return reservList;
  }

  Future<List<ReservationData>>? getStatusReservations(
      {required int statusId}) async {
    Map<String, dynamic>? response =
        await dataSource.getStatusReservations(statusId: statusId);
    List<ReservationData> reservList = [];
    if (response?['success'] == true && response?['data'] != null) {
      for (int i = 0; i < response!['data']!.length; i++) {
        reservList.add(
          ReservationData.fromJson(response['data'][i]),
        );
      }
    }
    return reservList;
  }

  Future<ReservationData?>? updateResevation(
      {required Map<String, String> body}) async {
    print("body $body");
    Map<String, dynamic>? response =
        await dataSource.updateResevation(body: body);
    ReservationData? reservation;
    if (response?['success'] == true && response?['data'] != null) {
      reservation = ReservationData.fromJson(response?['data']);
    }
    return reservation;
  }

  Future<ReservationDetailsModel> getReservDetails({required reservId}) async {
    ReservationDetailsModel response = ReservationDetailsModel.fromJson(
        await dataSource.getReservDetails(reservId: reservId));
    return response;
  }
}
