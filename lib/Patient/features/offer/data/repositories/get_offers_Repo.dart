import 'package:dr/Patient/features/offer/data/datasources/get_offers_ds.dart';
import 'package:dr/Patient/features/offer/data/models/get_offers_model.dart';

class GetOffersRepo {
  final GetOffersDS dataSource;

  GetOffersRepo({required this.dataSource});

  Future<GetOffersModel> getOffers() async {
    GetOffersModel MyOrdersResponse = GetOffersModel.fromJson(
      await dataSource.getOffers(),
    );
    return MyOrdersResponse;
  }
}
