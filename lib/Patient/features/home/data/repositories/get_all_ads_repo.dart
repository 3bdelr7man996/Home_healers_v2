import '../datasources/get_all_ads_ds.dart';
import '../models/get_all_ads_model.dart';

class GetAllAdsRepo {
  final GetAllAdsDS dataSource;

  GetAllAdsRepo({required this.dataSource});

  Future<GetAllAdsModel> GetAllAds() async {
    GetAllAdsModel getAllAds = GetAllAdsModel.fromJson(
      await dataSource.getAllAds(),
    );
    return getAllAds;
  }
}
