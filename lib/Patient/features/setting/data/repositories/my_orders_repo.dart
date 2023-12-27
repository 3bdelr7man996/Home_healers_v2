import 'package:dr/Patient/features/setting/data/datasources/my_orders_ds.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';

import '../models/inVoice_model.dart';

class MyOrdersRepo {
  final MyOrdersDS dataSource;

  MyOrdersRepo({required this.dataSource});

  Future<MyOrdersModel> GetMyOrders() async {
    MyOrdersModel MyOrdersResponse = MyOrdersModel.fromJson(
      await dataSource.GetMyOrders(),
    );
    return MyOrdersResponse;
  }
}

class ShowBillRepo {
  final ShowBillDS dataSource;

  ShowBillRepo({required this.dataSource});

  Future<OrderData> ShowBillScreen(var id) async {
    OrderData MyOrdersResponse = OrderData.fromJson(
      await dataSource.ShowBillScreen(id),
    );
    return MyOrdersResponse;
  }
}

class GetInvoiceRepo {
  final GetInvoiceDS dataSource;

  GetInvoiceRepo({required this.dataSource});

  Future<inVoiceModel> Getinvoice(var id) async {
    inVoiceModel MyOrdersResponse = inVoiceModel.fromJson(
      await dataSource.GetInvoice(id),
    );
    return MyOrdersResponse;
  }
}
