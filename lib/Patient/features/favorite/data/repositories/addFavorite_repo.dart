import 'package:dr/Patient/features/favorite/data/datasources/addFavorite_ds.dart';
import 'package:dr/Patient/features/favorite/data/models/AddFavoriteModel.dart';

class AddFavoriteRepo {
  final AddFavoriteDS dataSource;

  AddFavoriteRepo({required this.dataSource});

  Future<AddFavoriteModel> AddFavorite({
    required Map<String, dynamic> body,
  }) async {
    print("bodyyyy== $body");
    AddFavoriteModel AddFavoriteResponse = AddFavoriteModel.fromJson(
      await dataSource.addFavorite(
        body: body,
      ),
    );
    return AddFavoriteResponse;
  }
}
