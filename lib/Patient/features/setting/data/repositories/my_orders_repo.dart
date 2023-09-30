import 'package:dr/Patient/features/setting/data/datasources/my_orders_ds.dart';
import 'package:dr/Patient/features/setting/data/models/my_orders_model.dart';

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
