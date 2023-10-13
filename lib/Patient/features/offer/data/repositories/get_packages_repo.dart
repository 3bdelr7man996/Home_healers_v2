import 'package:dr/Patient/features/offer/data/datasources/get_packages_ds.dart';
import 'package:dr/Patient/features/offer/data/models/get_packages_model.dart';

class GetPackagesRepo {
  final GetPackagesDS dataSource;

  GetPackagesRepo({required this.dataSource});

  Future<GetPackagesModel> GetPackages() async {
    GetPackagesModel MyOrdersResponse = GetPackagesModel.fromJson(
      await dataSource.GetPackages(),
    );
    return MyOrdersResponse;
  }
}
