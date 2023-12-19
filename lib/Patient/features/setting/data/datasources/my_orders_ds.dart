import 'package:dr/core/utils/http_helper.dart';

class MyOrdersDS {
  final ApiBaseHelper apiHelper;

  MyOrdersDS({required this.apiHelper});

  Future<Map<String, dynamic>?> GetMyOrders() async {
    Map<String, dynamic>? response =
        await apiHelper.get("/api/user/reservations");
    return response;
  }
}

class ShowBillDS {
  final ApiBaseHelper apiHelper;

  ShowBillDS({required this.apiHelper});

  Future<Map<String, dynamic>?> ShowBillScreen(var id) async {
    Map<String, dynamic>? response =
        await apiHelper.get("/api/reservaionGetByID?id=${id}");
    return response!['data']['userReservations'][0];
  }
}
