import 'package:dr/Patient/features/setting/data/datasources/my_points_ds.dart';
import 'package:dr/Patient/features/setting/data/models/my_points_model.dart';
import 'package:dr/Patient/features/setting/data/models/points_to_cashback_model.dart';

class GetPointsRepo {
  final MyPointsDS dataSource;

  GetPointsRepo({required this.dataSource});

  Future<MyPointsModel> GetPoints() async {
    MyPointsModel MyOrdersResponse = MyPointsModel.fromJson(
      await dataSource.GetPoints(),
    );
    return MyOrdersResponse;
  }

  Future<pointsToCashbackModel> pointsToCashback({
    required Map<String, dynamic> body,
  }) async {
    print("bodyyyy== $body");
    pointsToCashbackModel pointsToCashback = pointsToCashbackModel.fromJson(
      await dataSource.pointsToCashback(
        body: body,
      ),
    );
    return pointsToCashback;
  }
}
